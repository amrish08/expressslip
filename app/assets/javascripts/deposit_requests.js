document.addEventListener("turbo:load", function () {
    const amountInput = document.getElementById("amount-input");
    const adjustedAmountDisplay = document.getElementById("adjusted-amount");

    if (amountInput) {
      amountInput.addEventListener("input", function () {
        const amount = parseFloat(amountInput.value) || 0;
        const adjustedAmount = (amount * 0.99).toFixed(2); // Deducting 1%
        adjustedAmountDisplay.textContent = `${adjustedAmount} BDT`;
      });
    }
  });