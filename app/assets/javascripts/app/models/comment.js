(function () {

  window.Comment = Backbone.Model.extend({});

  window.CommentWall = Backbone.Collection.extend({
    model: Comment,

    filterByKind: function (kind) {
      // Gets all comments that voted for the given kind.
      return this.filter(function (comment) {
        return comment.get('kind') === kind;
      });
    }
  });

})();