import Rails from "@rails/ujs";

const productsFilter = () => {
    let checkBoxes = document.querySelectorAll(".form-check-input");
    let form = document.querySelector('#filter-form');
    
    for (const check of checkBoxes) {
        check.addEventListener( 'change', function() {
            console.log('hey there!', form);
            Rails.fire(form, 'submit');
        });
    }
}

export { productsFilter };

