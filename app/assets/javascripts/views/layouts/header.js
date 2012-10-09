App.Views.Layouts.Header = Backbone.Marionette.Layout.extend({
  template: 'layouts/header',

  regions: {},

  views:{},

  onShow: function() {}
});

App.addInitializer(function() {
  App.layouts.header = new App.Views.Layouts.Header();
});
