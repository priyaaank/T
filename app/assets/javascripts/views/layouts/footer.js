App.Views.Layouts.Footer = Backbone.Marionette.Layout.extend({
  template: 'layouts/footer',
  
  regions: {},

  views: {},

  onShow: function() {}
});

App.addInitializer(function() {
  App.layouts.footer = new App.Views.Layouts.Footer();
});
