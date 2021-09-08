import RestModel from 'discourse/models/rest';

/**
 * Has to be implemented for `../controllers/notebook.js.es6` in order to use
 * Discourse’s store properly.
 */
export default RestModel.extend({
  updateProperties() {
    return this.getProperties('key', 'link');
  }
});
