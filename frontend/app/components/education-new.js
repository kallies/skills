import { inject as service } from "@ember/service";
import Component from "@ember/component";
import { computed } from "@ember/object";
import { on } from "@ember/object/evented";
import { EKMixin, keyUp } from "ember-keyboard";

export default Component.extend(EKMixin, {
  store: service(),
  intl: service(),

  newEducation: computed("personId", function() {
    return this.get("store").createRecord("education");
  }),

  activateKeyboard: on("init", function() {
    this.set("keyboardActivated", true);
  }),

  abortEducationNew: on(keyUp("Escape"), function() {
    if (this.get("newEducation.isNew")) {
      this.get("newEducation").destroyRecord();
    }
    this.done(false);
  }),

  willDestroyElement() {
    if (this.get("newEducation.isNew")) {
      this.get("newEducation").destroyRecord();
    }
  },

  setInitialState(context) {
    context.set("newEducation", context.get("store").createRecord("education"));
    context.sendAction("done", true);
  },

  actions: {
    abortNew(event) {
      event.preventDefault();
      this.sendAction("done", false);
    },

    submit(newEducation, initNew, event) {
      event.preventDefault();
      let person = this.get("store").peekRecord("person", this.get("personId"));
      newEducation.set("person", person);
      return newEducation
        .save()
        .then(education => {
          this.sendAction("done", false);
          if (initNew) this.sendAction("setInitialState", this);
        })
        .then(() => this.get("notify").success("Ausbildung wurde hinzugefügt!"))
        .catch(() => {
          this.set("newEducation.person", null);
          this.get("newEducation.errors").forEach(({ attribute, message }) => {
            let translated_attribute = this.get("intl").t(
              `education.${attribute}`
            );
            this.get("notify").alert(`${translated_attribute} ${message}`, {
              closeAfter: 10000
            });
          });
        });
    }
  }
});
