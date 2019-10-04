import * as Sentry from "@sentry/browser";
import { Ember } from "@sentry/integrations/esm";
import ENV from "../config/environment";

export function initialize(application) {
  Sentry.init({
    dsn: ENV.sentry.dsn,
    integrations: [new Ember()]
  });
}

export default {
  initialize
};
