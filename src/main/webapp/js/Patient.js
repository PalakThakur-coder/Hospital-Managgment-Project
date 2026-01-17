function cancelForm() {
	window.location.href = "Dashboard.jsp";
}
var today = new Date();

var dd = today.getDate();
var mm = today.getMonth() + 1;
var yyyy = today.getFullYear();

if (mm < 10) {

	mm = '0' + mm;

}

if (dd < 10) {

	dd = '0' + dd;

}

var formattedDate = yyyy + '-' + mm + '-' + dd;

document.getElementById('date').value = formattedDate;
function toggleOtherIdName(show) {
	var otherIdNameBox = document.getElementById('otherIdNameBox');
	var otherIdNameInput = document
		.querySelector('input[name="idname_input"]');

	if (show) {
		otherIdNameBox.style.display = 'block';
		otherIdNameInput.required = true;
	} else {
		otherIdNameBox.style.display = 'none';
		otherIdNameInput.required = false;
		otherIdNameInput.value = '';
	}
}

document
	.addEventListener(
		"DOMContentLoaded",
		function() {
			const mobileInput = document
				.getElementById("mobileno");
			const mobileError = document
				.getElementById("mobile-error");

			mobileInput
				.addEventListener(
					"blur",
					function() {
						const mobileValue = mobileInput.value;
						const mobilePattern = /^[0-9]{10}$/; // Assuming a 10-digit mobile number

						if (!mobilePattern
							.test(mobileValue)) {
							mobileError.textContent = "Please enter a valid 10-digit mobile number.";
							mobileInput.classList
								.add("error");

						} else {
							mobileError.textContent = "";
							mobileInput.classList
								.remove("error");
						}
					});
		});
document
	.addEventListener(
		"DOMContentLoaded",
		function() {
			const emailInput = document.getElementById("email");
			const emailError = document
				.getElementById("email-error");

			emailInput
				.addEventListener(
					"blur",
					function() {
						const emailValue = emailInput.value;
						const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

						if (!emailPattern
							.test(emailValue)) {
							emailError.textContent = "Please enter a valid email address.";
							emailInput.classList
								.add("error");
						} else {
							emailError.textContent = "";
							emailInput.classList
								.remove("error");
						}
					});
		});
		document.addEventListener("DOMContentLoaded", function () {
    const ageInput = document.getElementById("age");
    const ageError = document.getElementById("age-error");

    ageInput.addEventListener("blur", function () {
        const ageValue = ageInput.value;
        const agePattern = /^\d+$/; // Regular expression to check for a positive integer

        if (!agePattern.test(ageValue)) {
            ageError.textContent = "Please enter a valid age (a positive integer).";
            ageInput.classList.add("error");
        } else {
            const ageNumber = parseInt(ageValue, 10);
            if (ageNumber < 0 || ageNumber > 150) { // Change the age range as needed
                ageError.textContent = "Please enter a valid age within the range of 0 to 150.";
                ageInput.classList.add("error");
            } else {
                ageError.textContent = "";
                ageInput.classList.remove("error");
            }
        }
    });
});
document.addEventListener("DOMContentLoaded", function () {
			    const nameInput = document.getElementById("name");
			    const nameError = document.getElementById("name-error");

			    nameInput.addEventListener("blur", function () {
			        const nameValue = nameInput.value;

			        // You can define your custom validation rules for the name here
			        // For example, you might want to check if the name contains only letters and spaces.

			        const namePattern = /^[A-Za-z\s]+$/; // Only letters and spaces are allowed

			        if (!namePattern.test(nameValue)) {
			            nameError.textContent = "Please enter a valid name (only letters and spaces are allowed).";
			            nameInput.classList.add("error");
			        } else {
			            nameError.textContent = "";
			            nameInput.classList.remove("error");
			        }
			    });
			});
			document.addEventListener("DOMContentLoaded", function () {
			    const nameInput = document.getElementById("grandfathername");
			    const nameError = document.getElementById("grandfather-error");

			    nameInput.addEventListener("blur", function () {
			        const nameValue = nameInput.value;

			        // You can define your custom validation rules for the name here
			        // For example, you might want to check if the name contains only letters and spaces.

			        const namePattern = /^[A-Za-z\s]+$/; // Only letters and spaces are allowed

			        if (!namePattern.test(nameValue)) {
			            nameError.textContent = "Please enter a valid name (only letters and spaces are allowed).";
			            nameInput.classList.add("error");
			        } else {
			            nameError.textContent = "";
			            nameInput.classList.remove("error");
			        }
			    });
			});
			document.addEventListener("DOMContentLoaded", function () {
			    const nameInput = document.getElementById("fathername");
			    const nameError = document.getElementById("father-error");

			    nameInput.addEventListener("blur", function () {
			        const nameValue = nameInput.value;

			        // You can define your custom validation rules for the name here
			        // For example, you might want to check if the name contains only letters and spaces.

			        const namePattern = /^[A-Za-z\s]+$/; // Only letters and spaces are allowed

			        if (!namePattern.test(nameValue)) {
			            nameError.textContent = "Please enter a valid name (only letters and spaces are allowed).";
			            nameInput.classList.add("error");
			        } else {
			            nameError.textContent = "";
			            nameInput.classList.remove("error");
			        }
			    });
			});
			document.addEventListener("DOMContentLoaded", function () {
			    const nameInput = document.getElementById("city");
			    const nameError = document.getElementById("city-error");

			    nameInput.addEventListener("blur", function () {
			        const nameValue = nameInput.value;

			        // You can define your custom validation rules for the name here
			        // For example, you might want to check if the name contains only letters and spaces.

			        const namePattern = /^[A-Za-z\s]+$/; // Only letters and spaces are allowed

			        if (!namePattern.test(nameValue)) {
			            nameError.textContent = "Please enter a valid name (only letters and spaces are allowed).";
			            nameInput.classList.add("error");
			        } else {
			            nameError.textContent = "";
			            nameInput.classList.remove("error");
			        }
			    });
			});
			document.addEventListener("DOMContentLoaded", function () {
			    const nameInput = document.getElementById("state");
			    const nameError = document.getElementById("state-error");

			    nameInput.addEventListener("blur", function () {
			        const nameValue = nameInput.value;

			        // You can define your custom validation rules for the name here
			        // For example, you might want to check if the name contains only letters and spaces.

			        const namePattern = /^[A-Za-z\s]+$/; // Only letters and spaces are allowed

			        if (!namePattern.test(nameValue)) {
			            nameError.textContent = "Please enter a valid name (only letters and spaces are allowed).";
			            nameInput.classList.add("error");
			        } else {
			            nameError.textContent = "";
			            nameInput.classList.remove("error");
			        }
			    });
			});
			document.addEventListener("DOMContentLoaded", function () {
    const aadharInput = document.getElementById("idno");
    const aadharRadio = document.getElementById("aadharRadio");
    const idNumberError = document.getElementById("idno-error");

    aadharRadio.addEventListener("change", function () {
        if (aadharRadio.checked) {
            // Trigger validation when "Aadhar Card" is selected
            const aadharValue = aadharInput.value;
            const aadharPattern = /^\d{12}$/; // A 12-digit number is the Aadhar Card format

            if (!aadharPattern.test(aadharValue)) {
                idNumberError.textContent = "Please enter a valid 12-digit Aadhar Card number.";
                aadharInput.classList.add("error");
            } else {
                idNumberError.textContent = "";
                aadharInput.classList.remove("error");
            }
        }
    });
});
			document.addEventListener("DOMContentLoaded", function () {
			    const panInput = document.getElementById("idno"); // Assuming "idno" is the ID Number field
			    const panRadio = document.getElementById("panRadio");
			    const idNumberError = document.getElementById("idno-error");

			    panRadio.addEventListener("change", function () {
			        if (panRadio.checked) {
			            // Trigger validation when "Pan Card" is selected
			            const panValue = panInput.value;
			            const panPattern = /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/; // Example pattern for a Pan Card

			            if (!panPattern.test(panValue)) {
			                idNumberError.textContent = "Please enter a valid Pan Card number (e.g., ABCDE1234F).";
			                panInput.classList.add("error");
			            } else {
			                idNumberError.textContent = "";
			                panInput.classList.remove("error");
			            }
			        }
			    });
			});
			document.addEventListener("DOMContentLoaded", function () {
			    const idNumberInput = document.getElementById("idno"); // Assuming "idno" is the ID Number field
			    const voterRadio = document.getElementById("voterRadio");
			    const idNumberError = document.getElementById("idno-error");

			    voterRadio.addEventListener("change", function () {
			        if (voterRadio.checked) {
			            // Trigger validation when "Voter Card" is selected
			            const idNumberValue = idNumberInput.value;
			            const voterPattern = /^[A-Z]{3}[0-9]{7}$/; // Example pattern for a Voter Card

			            if (!voterPattern.test(idNumberValue)) {
			                idNumberError.textContent = "Please enter a valid Voter Card number (e.g., ABC1234567).";
			                idNumberInput.classList.add("error");
			            } else {
			                idNumberError.textContent = "";
			                idNumberInput.classList.remove("error");
			            }
			        }
			    });
			});
			document.addEventListener("DOMContentLoaded", function () {
			    const idNameRadio = document.getElementById("otherRadio");
			    const idNumberInput = document.getElementById("idno"); // Assuming "idno" is the ID Number field
			    const idNumberError = document.getElementById("idno-error");

			    idNameRadio.addEventListener("change", function () {
			        if (idNameRadio.checked) {
			            // Trigger validation when "Other" is selected
			            const idNameValue = idNameRadio.value;
			            const idNumberValue = idNumberInput.value;
			            const drivingLicensePattern = /^([A-Z]{2}\d{2}[ ]?\d{11})|([A-Z]{2}\d{13})$/; // Example pattern for a Driving License

			            if (idNameValue === "Other" && drivingLicensePattern.test(idNumberValue)) {
			                idNumberError.textContent = "Please select a different ID Name for a Driving License.";
			                idNumberInput.classList.add("error");
			            } else {
			                idNumberError.textContent = "";
			                idNumberInput.classList.remove("error");
			            }
			        }
			    });
			});