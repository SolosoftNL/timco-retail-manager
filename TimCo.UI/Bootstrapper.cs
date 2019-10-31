using AutoMapper;
using Caliburn.Micro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using TimCo.UI.Infrastructure;
using TimCo.UI.Shell;

namespace TimCo.UI
{
    class Bootstrapper : BootstrapperBase
    {
        readonly SimpleContainer container = new SimpleContainer();

        public Bootstrapper() => Initialize();

        protected override void Configure()
        {
            container.Instance(container)
                .Instance(ConfigureAutoMapper())
                .Singleton<IEventAggregator, EventAggregator>()
                .Singleton<IWindowManager, WindowManager>()
                .PerRequest<IShell, ShellViewModel>();

            GetType().Assembly.GetTypes()
                .Where(type => type.IsClass)
                .Where(cls => cls.Name.EndsWith("ViewModel"))
                .ToList()
                .ForEach(vm => container.RegisterPerRequest(vm, vm.ToString(), vm));
        }

        IMapper ConfigureAutoMapper()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile(new MapperProfile());
            });

            return config.CreateMapper();
        }

        protected override void BuildUp(object instance) => container.BuildUp(instance);

        protected override IEnumerable<object> GetAllInstances(Type service) => container.GetAllInstances(service);

        protected override object GetInstance(Type service, string key) => container.GetInstance(service, key);

        protected override void OnStartup(object sender, StartupEventArgs e) => DisplayRootViewFor<IShell>();
    }
}
