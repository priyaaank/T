var app = app || {}
var AppRouter = Backbone.Router.extend({

  routes : {
    '' : 'home_page',
    '../users/sign_in' : 'sign_in_user'
  },

  home_page : function() {
    console.log("rendering home page");
  },

  sign_in_user : function() {
    console.log(app.Login);
  },

});

var app = new AppRouter();
Backbone.history.start();
