let currentFilter = 'all';
let currentSort = 'rating';
let searchQuery = '';

function isOpenNow(hoursString) {
    if (!hoursString) return false;
    
    const now = new Date();
    const currentHour = now.getHours();
    const currentMinute = now.getMinutes();
    const currentTime = currentHour * 60 + currentMinute;
    
    const parts = hoursString.split(' - ');
    if (parts.length !== 2) return false;
    
    const [openHour, openMin] = parts[0].split(':').map(Number);
    const [closeHour, closeMin] = parts[1].split(':').map(Number);
    
    const openTime = openHour * 60 + openMin;
    const closeTime = closeHour * 60 + closeMin;
    
    return currentTime >= openTime && currentTime < closeTime;
}

function hasHotDrinks(cafe) {
    return cafe.drinks.some(drink => 
        drink.toLowerCase().startsWith('hot') || 
        (!drink.toLowerCase().includes('iced') && !drink.toLowerCase().includes('frozen'))
    );
}

function setFilter(filter) {
    currentFilter = filter;
    document.querySelectorAll('.filter-btn').forEach(btn => {
        btn.classList.toggle('active', btn.dataset.filter === filter);
    });
    renderCafes();
}

function performSearch() {
    searchQuery = document.getElementById('searchInput').value.toLowerCase();
    renderCafes();
}

function sortResults() {
    currentSort = document.getElementById('sortDropdown').value;
    renderCafes();
}

function getFilteredCafes() {
    let filtered = [...cafesDatabase];

    if (searchQuery) {
        filtered = filtered.filter(cafe =>
            cafe.name.toLowerCase().includes(searchQuery) ||
            cafe.neighborhood.toLowerCase().includes(searchQuery) ||
            cafe.tags.some(tag => tag.toLowerCase().includes(searchQuery)) ||
            cafe.drinks.some(drink => drink.toLowerCase().includes(searchQuery))
        );
    }

    switch (currentFilter) {
        case 'open-now':
            filtered = filtered.filter(cafe => isOpenNow(cafe.hours));
            break;
        case 'hot':
            filtered = filtered.filter(cafe => hasHotDrinks(cafe));
            break;
        case 'iced':
            filtered = filtered.filter(cafe => hasIcedDrinks(cafe));
            break;
    }

    switch (currentSort) {
        case 'rating':
            filtered.sort((a, b) => b.rating - a.rating);
            break;
        case 'distance':
            filtered.sort((a, b) => a.distance - b.distance);
            break;
        case 'price-low':
            filtered.sort((a, b) => a.priceLevel - b.priceLevel);
            break;
        case 'price-high':
            filtered.sort((a, b) => b.priceLevel - a.priceLevel);
            break;
        case 'reviews':
            filtered.sort((a, b) => b.reviewCount - a.reviewCount);
            break;
    }

    return filtered;
}

function renderCafes() {
    const cafes = getFilteredCafes();
    const grid = document.getElementById('cafesGrid');
    const emptyState = document.getElementById('emptyState');
    const resultsCount = document.getElementById('resultsCount');

    resultsCount.textContent = `Showing ${cafes.length} cafe${cafes.length !== 1 ? 's' : ''}`;

    if (cafes.length === 0) {
        grid.innerHTML = '';
        emptyState.classList.add('active');
        return;
    }

    emptyState.classList.remove('active');
    grid.innerHTML = cafes.map(cafe => createCafeCard(cafe)).join('');
}

function createCafeCard(cafe) {
    const priceSymbol = '$'.repeat(cafe.priceLevel);
    const badgeHTML = cafe.badge ? `<div class="cafe-badge">${cafe.badge}</div>` : '';

    return `
        <div class="cafe-card" onclick="openModal(${cafe.id})">
            <div class="cafe-image" style="background-image: url('${cafe.image}'); background-size: cover; background-position: center;">
                ${badgeHTML}
                <div class="cafe-rating">
                    <svg viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
                    ${cafe.rating}
                </div>
            </div>
            <div class="cafe-content">
                <h3 class="cafe-name">${cafe.name}</h3>
                <p class="cafe-location">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z"/>
                        <circle cx="12" cy="10" r="3"/>
                    </svg>
                    ${cafe.neighborhood}
                </p>
                <p class="cafe-hours">🕐 ${cafe.hours}</p>
                <div class="cafe-tags">
                    ${cafe.tags.slice(0, 3).map(tag => `<span class="cafe-tag">${tag}</span>`).join('')}
                </div>
                <div class="cafe-meta">
                    <span class="cafe-price">${priceSymbol}</span>
                    <span class="cafe-reviews-count">${cafe.reviewCount} reviews</span>
                    <span class="cafe-distance">${cafe.distance} mi from NEU</span>
                </div>
            </div>
        </div>
    `;
}

function createStarRating(rating) {
    return Array(5).fill(0).map((_, i) =>
        `<svg viewBox="0 0 24 24" style="opacity: ${i < rating ? 1 : 0.3}"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>`
    ).join('');
}

function openModal(cafeId) {
    const cafe = cafesDatabase.find(c => c.id === cafeId);
    if (!cafe) return;

    document.querySelector('.modal-header').style.backgroundImage = cafe.image ? `url('${cafe.image}')` : '';
    document.querySelector('.modal-header').style.backgroundSize = 'cover';
    document.querySelector('.modal-header').style.backgroundPosition = 'center';
    document.getElementById('modalTitle').textContent = cafe.name;
    document.getElementById('modalSubtitle').textContent = cafe.address;
    document.getElementById('modalDescription').textContent = cafe.description;
    document.getElementById('modalHours').textContent = cafe.hours;

    document.getElementById('modalStats').innerHTML = `
        <div class="stat-box">
            <div class="stat-value">${cafe.rating}</div>
            <div class="stat-label">Rating</div>
        </div>
        <div class="stat-box">
            <div class="stat-value">${cafe.reviewCount}</div>
            <div class="stat-label">Reviews</div>
        </div>
        <div class="stat-box">
            <div class="stat-value">${'$'.repeat(cafe.priceLevel)}</div>
            <div class="stat-label">Price</div>
        </div>
        <div class="stat-box">
            <div class="stat-value">${cafe.distance}mi</div>
            <div class="stat-label">From NEU</div>
        </div>
    `;

    document.getElementById('modalDrinks').innerHTML = cafe.drinks.map(drink => {
        const isIced = drink.toLowerCase().includes('iced') || drink.toLowerCase().includes('frozen');
        const icon = isIced ? '<span class="iced-icon">❄️</span>' : '<span class="hot-icon">☕</span>';
        return `<div class="drink-item">${icon} ${drink}</div>`;
    }).join('');

    document.getElementById('modalReviews').innerHTML = cafe.reviews.map(review => `
        <div class="review-card">
            <div class="review-header">
                <div class="reviewer-info">
                    <span class="reviewer-name">${review.name}</span>
                    <span class="review-drink">on ${review.drink}</span>
                </div>
                <div class="review-rating">${createStarRating(review.rating)}</div>
            </div>
            <p class="review-text">${review.text}</p>
            <p class="review-date">${review.date}</p>
        </div>
    `).join('');

    document.getElementById('modalOverlay').classList.add('active');
    document.body.style.overflow = 'hidden';
    document.querySelector('.map-section').style.display = 'none';
}

function closeModal(event) {
    if (event && event.target !== event.currentTarget) return;
    document.getElementById('modalOverlay').classList.remove('active');
    document.body.style.overflow = '';
    document.querySelector('.map-section').style.display = 'block';
}

function initMap() {
    const map = L.map('map').setView([42.3398, -71.0892], 14);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '© OpenStreetMap contributors'
    }).addTo(map);

    cafesDatabase.forEach(cafe => {
        if (cafe.coords) {
            const marker = L.marker(cafe.coords).addTo(map);
            marker.bindPopup(`
                <strong>${cafe.name}</strong><br>
                ${cafe.neighborhood}<br>
                ⭐ ${cafe.rating} · ${cafe.priceLevel === 1 ? '$' : cafe.priceLevel === 2 ? '$$' : '$$$'}
                <button onclick="openModal(${cafe.id})" style="margin-top: 8px; padding: 4px 12px; background: #3d6b56; color: white; border: none; border-radius: 15px; cursor: pointer;">View Details</button>
            `);
        }
    });
}

document.addEventListener('DOMContentLoaded', () => {
    setFilter('all');

    const totalDrinks = cafesDatabase.reduce((sum, cafe) => sum + cafe.drinks.length, 0);
    const totalReviews = cafesDatabase.reduce((sum, cafe) => sum + cafe.reviewCount, 0);
    document.getElementById('totalCafes').textContent = cafesDatabase.length;
    document.getElementById('totalDrinks').textContent = totalDrinks;
    document.getElementById('totalReviews').textContent = totalReviews;

    document.getElementById('searchInput').addEventListener('keypress', function (e) {
        if (e.key === 'Enter') performSearch();
    });

    document.getElementById('searchInput').addEventListener('input', function (e) {
        searchQuery = e.target.value.toLowerCase();
        renderCafes();
    });

    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') closeModal();
    });

    initMap();
});