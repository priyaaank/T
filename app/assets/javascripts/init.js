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
  loginWidget: '#login-widget'
});

App.content.show(App.layouts.home);