const pay = () => {

Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    const card = {
      number: formData.get("buyer_shipping_address[number]"),         /*order[number]*/
      cvc: formData.get("buyer_shipping_address[cvc]"),               /*order[cvc]*/
      exp_month: formData.get("buyer_shipping_address[exp_month]"),                 /*order[exp_month]*/
      exp_year: `20${formData.get("buyer_shipping_address[exp_year]")}`,          /*order[exp_year]*/
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;

        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      /*クレジットカードの情報の削除のため*/
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      /*フォーム情報をサーバーサイドに送信のため*/
      document.getElementById("charge-form").submit();

    });
  });
};

window.addEventListener("load", pay);
