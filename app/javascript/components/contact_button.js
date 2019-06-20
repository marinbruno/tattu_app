const listen = () => {
  const form = document.forms['contact_form'];


  console.log("1");
  if (form) {
    console.log("2");
    document.forms['contact_form'].addEventListener('submit', function (event) {
      // Do something with the form's data here
      this.style['display'] = 'none';
      alert("Cool! We passed your name and contact to the artist. Soon he will contact you...");
      event.preventDefault();
    });
  }
}

export { listen }

