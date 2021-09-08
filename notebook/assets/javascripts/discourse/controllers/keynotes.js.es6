export default Ember.Controller.extend({
  init() {
    this._super();
    this.set('keynotes', []);
    this.fetchKeynotes();
  },

  fetchKeynotes() {
    this.store.findAll('keynote')
      .then(result => {
        for (const keynote of result.content) {
          this.keynotes.pushObject(keynote);
        }
      })
      .catch(console.error);
  },

  actions: {
    createKeynote(key, link)
    {
      key = document.getElementById("key_area").value
      link = document.getElementById("link_area").value
      const keynote_full = {};
      keynote_full[key] = link


      const keynoteRecord = this.store.createRecord('keynote', {
        id: Date.now(),
        key: key,
        link: link
      });
      console.log(keynoteRecord)

      keynoteRecord.save()
        .then(result => {
          this.keynotes.pushObject(result.target);
        })
        .catch(console.error);
    },

    deleteKeynote(keynote) {
      this.store.destroyRecord('keynote', keynote)
        .then(() => {
          this.keynotes.removeObject(keynote);
        })
        .catch(console.error);
    }
  }
});
