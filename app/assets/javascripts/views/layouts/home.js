App.Views.Layouts.Home = Backbone.Marionette.Layout.extend({
  template: 'layouts/home',

  regions : {
    loginWidget: 'login-widget'
  },

  views:{},

  onShow: function() {
    this.views.login = App.Views.RegistrationAndLogin.Login;
    this.loginWidget.show(new this.views.login);
  }
});


App.addInitializer(function() {
  App.layouts.home = new App.Views.Layouts.Home();
});
