const urlParams = new URLSearchParams(window.location.search);
const animalId = urlParams.get('animal_id');

function updateElementText(elementId, text)
{
	document.getElementById(elementId).textContent = text;
}

// Collect the text information for table and set thumbnail
fetch(`api/get_single_animal.php?animal_id=${animalId}`)
	.then(response => response.json())
	.then(data =>
	{
		// Update the class value here
		updateElementText('common-name', data.common_name);
		updateElementText('scientific-name', data.scientific_name);
		updateElementText('class', data.class_name);
		updateElementText('genus', data.genus_name);
		updateElementText('family', data.family_name);
		updateElementText('order', data.order_name);

		document.getElementById('thumbnail').src = 'thumbnails/' + data.thumbnail;
		document.getElementById('main-picture').src = 'thumbnails/' + data.thumbnail;
		document.title = data.common_name + ' - Animal Catalogue';

	})
	.catch(error =>
	{
		console.error('Error fetching data:', error);
	});

fetch(`api/get_animal_photos.php?animal_id=${animalId}`)
	.then(response => response.json())
	.then(data =>
	{
		const galleryContainer = document.getElementById('carousel');
		galleryContainer.innerHTML = '';
		data.forEach(animal_image =>
		{
			const dateTaken = new Date(animal_image.date_taken);
			const formattedDate = dateTaken.toLocaleDateString('en-GB',
			{
				day: '2-digit',
				month: '2-digit',
				year: 'numeric'
			});

			const col = document.createElement('div');
			col.classList.add('carousel-item');
			col.setAttribute('data-bs-interval', '10000');
			col.innerHTML = `
          <img src="images/${animal_image.filename}" class="d-block img-fluid" alt="${animal_image.caption ? animal_image.caption : 'A picture of a ' + animal_image.common_name}">
          <div>
              <p class="text-center">${animal_image.location_name}, ${animal_image.location_city} - ${formattedDate} </p>
            </div>
          </div>`;
			galleryContainer.appendChild(col);
		});
		// Set active to first carousel item
		if (galleryContainer.firstChild)
		{
			galleryContainer.firstChild.classList.add('active');
		}
		// Create and append the carousel controls
		const prevButton = document.createElement('button');
		prevButton.className = 'carousel-control-prev';
		prevButton.type = 'button';
		prevButton.setAttribute('data-bs-target', '#carousel');
		prevButton.setAttribute('data-bs-slide', 'prev');
		prevButton.innerHTML = `
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    `;

		const nextButton = document.createElement('button');
		nextButton.className = 'carousel-control-next';
		nextButton.type = 'button';
		nextButton.setAttribute('data-bs-target', '#carousel');
		nextButton.setAttribute('data-bs-slide', 'next');
		nextButton.innerHTML = `
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    `;

		galleryContainer.appendChild(prevButton);
		galleryContainer.appendChild(nextButton);
	})
	.catch(error => console.error('Error fetching data:', error));