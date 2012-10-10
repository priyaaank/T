App.Models.Beta = App.Models.Beta || {};
App.Models.Beta.Invitation = Backbone.Model.extend({
  url: "/invite.json",
  paramRoot: 'invite',

  defaults: {
    "email":""
  }
});
