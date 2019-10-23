class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.input =$("<input>");
    this.ul = $("<ul>");
  }
}

module.exports = UsersSearch;