App = new Backbone.Marionette.Application();

App.Views = {};
App.Views.Layouts = {};
App.Models = {};
App.Collections = {};
App.Routers = {};
App.Helpers = {};

App.layouts = {};

App.addRegions({
  content: '#content',
  header: '#header',
  footer: '#footer'
});

App.bind("initialize:after", function() {
  App.header.show(App.layouts.header);
  App.footer.show(App.layouts.footer);
  App.content.show(App.layouts.invitation);
});

App.vent.on("authentication:login", function() {
  App.content.show(App.layouts.home);
});
