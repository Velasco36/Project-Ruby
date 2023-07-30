import { Turbo } from "@hotwired/turbo-rails";

Turbo.StreamActions.redirect = function () {
  Turbo.visit(this.target);
};
import "controllers"
