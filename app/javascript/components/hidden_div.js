const showHide = (divId, element) => {
  function showDiv(divId, element)
  {
      document.getElementById(divId).style.display = element.value == 1 ? 'block' : 'none';
  }
}
export {showHide}
