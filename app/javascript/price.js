function price(){
  const fee = document.getElementById("item-price");
  fee.addEventListener('keyup', () => {
    const tax = (fee.value) * 0.1;
    const taxPrice = document.getElementById("add-tax-price");
    taxPrice.innerHTML =  `${tax.toLocaleString()}`;
    
    const profit = (fee.value) * 0.9;
    const profitPrice = document.getElementById("profit");
    profitPrice.innerHTML =`${profit.toLocaleString()}`;
  });
};
window.addEventListener('load', price);
