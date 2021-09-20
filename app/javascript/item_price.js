
window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  console.log(priceInput);

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    const taxValue = Math.floor(inputValue * 0.1);

    const addTaxDom = document.getElementById("add-tax-price");

    addTaxDom.innerHTML = taxValue

    const addProfitDom = document.getElementById("profit");

    addProfitDom.innerHTML = inputValue - taxValue
  })
});
