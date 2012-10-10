App.Views.Beta = App.Views.Beta || {};
App.Views.Beta.Invitation = Backbone.Marionette.ItemView.extend({
  
  template: 'privateBeta/betaInvitation',

  events: {
    'submit form' : 'rememberToInvite',
  },

  initialize: function() {
    this.model = new App.Models.Beta.Invitation();
    this.modelBinder = new Backbone.ModelBinder();
    this.inviteForm = $("#invite-form");
  },

  onRender: function() {
    this.modelBinder.bind(this.model, this.el);
  },

  rememberToInvite: function(event) {
    event.preventDefault();
    var el = $(this.el);

    this.model.save(this.model.attributes, {
      success: function() {
        value = HandlebarsTemplates['shared/notifications']({
          'notificationType': "success",
          'message': "Gee Thanks! We will let you know once we are ready to launch."
        });
        el.find("#modal-content").append(value);
        el.find("#invite-form").remove();
      },
      error: function() {
        console.log("failure");
      }
    });
  },
});
