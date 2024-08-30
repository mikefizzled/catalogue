// api.js


  window.onload = function() {
    fetchAnimals(0, 0, 0);
    fetchOptionData("api/get_classes.php", "classes", "class_common_name", "class_id");
    fetchOptionData("api/get_orders.php", "orders", "order_name", "order_id");
    fetchOptionData("api/get_families.php", "families", "family_name", "family_id", true);
  }

  function fetchOptionData(url, selectId, optionText, optionValue, isFamily = false){
    fetch(url)
    .then(res => res.json())
    .then(data =>{
    let select = document.getElementById(selectId);

    // Create All option - 0 is handled as all in the PHP
    let firstOption = select.options[0];
    firstOption.value = 0;
    firstOption.textContent = "All";

    select.innerHTML = "";
    select.appendChild(firstOption);

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

  function fetchAnimals(classId, orderId, familyId) {
    fetch(`api/get_animals.php?class_id=${classId}&order_id=${orderId}&family_id=${familyId}`)
      .then(response => response.json())
      .then(data => {
        const galleryContainer = document.getElementById('animal-gallery');
        galleryContainer.innerHTML = '';
        const total = document.getElementById('total');
        total.textContent = 'Showing 1 - ' + data.length + ' of ' + data.length;
        data.forEach(animal => {
          const col = document.createElement('a');
          col.classList.add('streched-link', 'remove-link-deco');
          col.href = `animal?animal_id=${animal.animal_id}`;
          col.innerHTML = `
                <div class="card animal-card">
                  <img src="thumbnails/${animal.thumbnail}" alt="${animal.common_name}"class="card-img-top">
                  <div>
                    <p class="text-center p-card">${animal.common_name}</p>
                  </div>
                </div>
                </a>`;
          galleryContainer.appendChild(col);
        });
      })
      .catch(error => console.error('Error fetching data:', error));
  }

  const selects = document.querySelectorAll('#classes, #orders, #families');

  selects.forEach(select => {
    select.addEventListener('change', (event) => {
      const selectedClassId = document.getElementById('classes').value;
      const selectedOrderId = document.getElementById('orders').value;
      const selectFamilyId = document.getElementById('families').value;
      if (event.target.id === 'classes') {
        fetchAnimals(selectedClassId, 0, 0);
        fetchOptionData(`api/get_families.php?class_id=${selectedClassId}`, "families", "family_name", "family_id", true);
        fetchOptionData(`api/get_orders.php?class_id=${selectedClassId}`, "orders", "order_name", "order_id");
      } else if (event.target.id === 'orders') {
        fetchOptionData(`api/get_families.php?order_id=${selectedOrderId}`, "families", "family_name", "family_id", true);
        fetchAnimals(selectedClassId, selectedOrderId, 0);
      } else if (event.target.id === 'families') {
        fetchAnimals(selectedClassId, selectedOrderId, selectFamilyId);
      }
    });
  });
