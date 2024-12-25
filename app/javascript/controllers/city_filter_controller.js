// app/javascript/controllers/city_filter_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["city", "country"];

  updateCities() {
    const country = this.countryTarget.value;

    fetch(`/medical_centers?country=${country}`)
      .then((response) => response.json())
      .then((data) => {
        this.cityTarget.innerHTML = `<option value="">Select City</option>`;
        data.cities.forEach((city) => {
          const option = document.createElement("option");
          option.value = city;
          option.text = city;
          this.cityTarget.appendChild(option);
        });
      });
  }
}
