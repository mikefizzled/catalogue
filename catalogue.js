// api.js


  window.onload = function() {
    const classSelect = document.getElementById('classes');
    const orderSelect = document.getElementById('orders');
    const familySelect = document.getElementById('families');
  
    const selectedClassId = classSelect.value;
    const selectedOrderId = orderSelect.value;
    const selectedFamilyId = familySelect.value;
  
    //if (selectedClassId) { fetchFamiliesByClass(selectedClassId);}
    if (selectedFamilyId) {
      fetchAnimalsByFamily(selectedFamilyId);
    }
  }
  fetchOptionData("api/get_classes.php", "classes", "class_common_name", "class_id");
  fetchOptionData("api/get_orders.php", "orders", "order_name", "order_id");
  fetchOptionData("api/get_families.php", "families", "family_name", "family_id", true);
  /*
  fetch("api/get_classes.php")
    .then(res => res.json())
    .then(data => {
      let select = document.getElementById("classes");
      data.forEach((classes) => {
        let option = document.createElement("option");
        option.classList.add('option-a');
        option.value = classes.class_id; // Set the value to the family_id
        option.textContent = `${classes.class_common_name}`; // Display the desired text
        select.appendChild(option);
      });
    });
*/


  function fetchOptionData(url, selectId, optionText, optionValue, isFamily = false){
    fetch(url)
    .then(res => res.json())
    .then(data =>{
    let select = document.getElementById(selectId);
    let firstOption = select.options[0];
    select.innerHTML = "";
    select.appendChild(firstOption);

    data.forEach((item) => {
      let option = document.createElement("option");
      option.classList.add('option-a');
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
/*
  fetch("api/get_orders.php")
  .then(res => res.json())
  .then(data => {
    let select = document.getElementById("orders");
    data.forEach((animal_order) => {
      let option = document.createElement("option");
      option.classList.add('option-a');
      option.value = animal_order.order_id; // Set the value to the family_id
      option.textContent = `${animal_order.order_name}`; // Display the desired text
      select.appendChild(option);
    });
  });
  
  function fetchFamiliesByClass(classId) {
    fetch(`api/get_families.php?class_id=${classId}`)
      .then(res => res.json())
      .then(data => {
        let select = document.getElementById("families");
        let firstOption = document.getElementById("families").options[0];
        select.innerHTML = "";
        select.appendChild(firstOption);
        data.forEach((family) => {
          let option = document.createElement("option");
          option.classList.add('option-a'); 
          option.value = family.family_id; // Set the value to the family_id
          option.textContent = `${family.family_name} (${family.common_name})`; // Display the desired text
          select.appendChild(option);
        });
      });
  }
*/
  function fetchOrdersByClass(classId) {
    fetch(`api/get_orders.php?class_id=${classId}`)
      .then(res => res.json())
      .then(data => {
        let select = document.getElementById("orders");
        let firstOption = document.getElementById("orders").options[0];
        select.innerHTML = "";      // Resets the select for rebuilding the options.
        select.appendChild(firstOption);
        data.forEach((animal_order) => {
          let option = document.createElement("option");
          option.classList.add('option-a'); 
          option.value = animal_order.order_id; // Set the value to the family_id
          option.textContent = `${animal_order.order_name}`; // Display the desired text
          select.appendChild(option);
        });
      });
  }


  function fetchFamiliesByOrder(orderId) {
    fetch(`api/get_families.php?order_id=${orderId}`)
      .then(res => res.json())
      .then(data => {
        let select = document.getElementById("families");
        let firstOption = document.getElementById("families").options[0];
        select.innerHTML = "";
        select.appendChild(firstOption);
        data.forEach((family) => {
          let option = document.createElement("option");
          option.classList.add('option-a'); 
          option.value = family.family_id; // Set the value to the family_id
          option.textContent = `${family.family_name} (${family.common_name})`; // Display the desired text
          select.appendChild(option);
        });
      });
  }
  
  // Get Animal data
  function fetchAnimalsByFamily(familyId) {
    fetch(`api/get_animals.php?family_id=${familyId}`)
      .then(response => response.json())
      .then(data => {
        const galleryContainer = document.getElementById('animal-gallery');
        galleryContainer.innerHTML = '';
        const total = document.getElementById('total');
        total.textContent = 'Showing 1 - ' + data.length + ' of ' + data.length;
        data.forEach(animal => {
          const col = document.createElement('a');
          col.classList.add('streched-link', 'a-card');
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
  
  // Get Animal data
  function fetchAnimalsByOrder(orderId) {
    fetch(`api/get_animals.php?order_id=${orderId}`)
      .then(response => response.json())
      .then(data => {
        const galleryContainer = document.getElementById('animal-gallery');
        galleryContainer.innerHTML = '';
        const total = document.getElementById('total');
        total.textContent = 'Showing 1 - ' + data.length + ' of ' + data.length;
        data.forEach(animal => {
          const col = document.createElement('a');
          col.classList.add('streched-link', 'a-card');
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

  const classSelected = document.getElementById('classes');
  classSelected.addEventListener('change', (event) => {
    const selectClassId = event.target.value;
    if (selectClassId) {
      //fetchFamiliesByClass(selectClassId);
      fetchOptionData(`api/get_families.php?class_id=${selectClassId}`, "families", "family_name", "family_id", true);
      fetchOrdersByClass(selectClassId);
    }
  })

  const orderSelected = document.getElementById('orders');
  orderSelected.addEventListener('change', (event) => {
    const orderSelectedId = event.target.value;
    if (orderSelectedId) {
      fetchFamiliesByOrder(orderSelectedId);
      
      fetchAnimalsByOrder(orderSelectedId)
    }
  })

  const select = document.getElementById('families');
  
  select.addEventListener('change', (event) => {
    const selectFamilyId = event.target.value;
    if (selectFamilyId) {
      fetchAnimalsByFamily(selectFamilyId);
    }
  })
