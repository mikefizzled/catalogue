window.onload = function() {
    fetchOptionData("api/get_genera.php", "genus-field", "genus_name", "genus_id");
    fetchOptionData("api/get_classes.php", "class-field", "class_common_name", "class_id");
    fetchOptionData("api/get_orders.php", "order-field", "order_name", "order_id");
    fetchOptionData("api/get_families.php", "family-field", "family_name", "family_id", true);

  }

  function fetchOptionData(url, selectId, optionText, optionValue, isFamily = false){
    fetch(url)
    .then(res => res.json())
    .then(data =>{
    let select = document.getElementById(selectId);

    data.forEach((item) => {
      let option = document.createElement("option");
      option.value = item[optionValue]; // Set the value to the family_id

      if (isFamily) {
        option.textContent = `${item.family_name} (${item.common_name})`;
      } else {
        option.textContent = item[optionText]; // Display the specified text
      }

      select.appendChild(option);
    })
    })
    .catch(error => console.error('Error fetching data:', error));
  }

  const selects = document.querySelectorAll('#class-field, #order-field, #family-field, #genus-field');

  selects.forEach(select => {
    select.addEventListener('change', (event) => {
      const selectedClassId = document.getElementById('class-field').value;
      const selectedOrderId = document.getElementById('order-field').value;
      const selectFamilyId = document.getElementById('family-field').value;
      const selectGenusId = document.getElementById('genus-field').value;
      fetchOptionData(`api/get_classes.php?`, "classes", "class_name", "class_id");
      fetchOptionData(`api/get_families.php?`, "families", "family_name", "family_id", true);
      fetchOptionData(`api/get_orders.php?`, "orders", "order_name", "order_id");
      fetchOptionData("api/get_genera.php?", "genus", "genus_name", "genus_id");
    });
  });
