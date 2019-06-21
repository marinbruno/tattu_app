const listen = () => {
  const form = document.forms['contact_form'];

  if (form) {
    document.forms['contact_form'].addEventListener('submit', function (event) {
      // Do something with the form's data here
      event.preventDefault();
      const mmm = document.querySelector('#exampleModal');
      $(mmm).modal('hide');
      form.style['display'] = 'none';
    });
  }
}

export { listen }

