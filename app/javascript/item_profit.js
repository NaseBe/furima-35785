function item(){
  const price = document.getElementById("item-price");
  const commission = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  const tax = 0.1;
  price.addEventListener("keyup", () => {
  const commissionVal = Math.floor(price.value * tax)
  commission.innerHTML = `${commissionVal.toLocaleString("en-US")}`
  profit.innerHTML = `${(price.value - commissionVal).toLocaleString("en-US")}`
  });
};
window.addEventListener('load', item);