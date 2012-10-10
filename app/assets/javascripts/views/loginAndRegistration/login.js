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
    this.modelBinder.bind(this.model, this.el);
  },

  login: function(e) {
    e.preventDefault();
    var el = $(this.el);

    this.model.save(this.model.attributes, {
      success: function(userSession, response) {
        console.log(userSession);
      },
      error: function(userSession, response) {
        var serverResponse = $.parseJSON(response.responseText);
        console.log(serverResponse);
      }
    });
  }
});
