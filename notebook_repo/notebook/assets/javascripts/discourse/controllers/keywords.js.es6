export default Ember.Controller.extend({
  init() {
    this._super();
    this.set('keywords', []);
    this.fetchKeywords();
  },

  fetchKeywords() {
    this.store.findAll('key')
      .then(result => {
        for (const keyword of result.key) {
          this.keywords.pushObject(keyword);
        }
      })
      .catch(console.error);
    this.store.findAll('link')
      .then(result => {
        for (const link of result.link) {
          this.keywords.pushObject(link);
        }
      })
      .catch(console.error);
  },

  actions: {
    createKeyword(key, link)
    {
      key = document.getElementById("key_area").value
      link = document.getElementById("link_area").value
      const keyword_full = {};
      keyword_full[key] = link


      const keywordRecord = this.store.createRecord('keyword', {
        id: Date.now(),
        key: key,
        link: link
      });
      console.log(keywordRecord)

      keywordRecord.save()
        .then(result => {
          this.keywords.pushObject(result.target);
        })
        .catch(console.error);
    }
  }
});
