document.addEventListener("DOMContentLoaded", function () {
    const countryField = document.getElementById("slip_country");
    const cityField = document.getElementById("slip_city");
    const medicalCentreField = document.getElementById("medical_centre");
  
    const updateMedicalCentres = () => {
      const country = countryField.value;
      const city = cityField.value;
  
      if (country && city) {
        fetch(`medical_index_centers?country=${encodeURIComponent(country)}&city=${encodeURIComponent(city)}`)
          .then(response => response.json())
          .then(data => {
            medicalCentreField.innerHTML = '<option value="">Select Medical Centre</option>';
            data.centres.forEach(centre => {
              const option = document.createElement("option");
              option.value = centre.id;
              option.textContent = centre.name;
              medicalCentreField.appendChild(option);
            });
          })
          .catch(error => console.error("Error fetching medical centres:", error));
      } else {
        medicalCentreField.innerHTML = '<option value="">Select Medical Centre</option>';
      }
    };
  
    countryField.addEventListener("change", updateMedicalCentres);
    cityField.addEventListener("change", updateMedicalCentres);
  });
  