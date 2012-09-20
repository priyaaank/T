App.Views.LoginAndRegistration = App.Views.LoginAndRegistration || {};

App.Views.LoginAndRegistration.Login = Backbone.Marionette.ItemView.extend({
  
  template: 'registrationAndLogin/login',

  events: {
    'submit form' : 'login'
  },

  initialize: function() {
    this.model = new App.Models.UserSession();
    this.modelBinder = new Backbone.ModelBinder();
  },

  onRender: function() {
    this.ModelBinder.bind(this.model, this.el);
  },

  login: function(e) {
    e.preventDefault();
    console.log("trying to login");
  }

});
