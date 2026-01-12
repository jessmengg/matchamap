
const cafesDatabase = [
    {
        id: 1,
        name: "Tatte Bakery & Cafe",
        image: "images/tatte.jpg",
        neighborhood: "Northeastern Campus",
        address: "369 Huntington Ave, Boston, MA 02115",
        coords: [42.3400, -71.0905],
        rating: 3.7,
        reviewCount: 7,
        priceLevel: 2,
        distance: 0.1,
        tags: ["Iced Options", "Near Campus"],
        badge: null,
        description: "Located in Northeastern Campus, offering 3 matcha drinks including Hot Matcha Latte, Iced Matcha Latte, Iced Sparkling Matcha Lemonade.",
        hours: "07:00 - 18:00",
        drinks: [
            "Hot Matcha Latte",
            "Iced Matcha Latte",
            "Iced Sparkling Matcha Lemonade"
        ],
        reviews: [
            { name: "Jenna Cross", rating: 5, text: "Freshly whisked and vibrant color, highly recommend.", date: "9 months ago", drink: "Iced Matcha Latte" },
            { name: "Caitlin Moore", rating: 4, text: "Perfect temperature and not overly sweet.", date: "21 months ago", drink: "Iced Sparkling Matcha Lemonade" },
            { name: "Jayden Brooks", rating: 4, text: "Good value compared to nearby cafes.", date: "52 months ago", drink: "Iced Matcha Latte" }
        ]
    },
    {
        id: 2,
        name: "Starbucks",
        image: "images/starbucks.jpg",
        neighborhood: "Northeastern Campus",
        address: "360 Huntington Ave, Boston, MA 02115",
        coords: [42.3390, -71.0874],
        rating: 3.8,
        reviewCount: 20,
        priceLevel: 2,
        distance: 0.0,
        tags: ["Iced Options", "Near Campus"],
        badge: null,
        description: "Located in Northeastern Campus, offering 8 matcha drinks including Hot Protein Matcha, Hot Sugar-Free Vanilla Protein Matcha, Hot Matcha Latte.",
        hours: "07:00 - 21:00",
        drinks: [
            "Hot Protein Matcha",
            "Hot Sugar-Free Vanilla Protein Matcha",
            "Hot Matcha Latte",
            "Iced Protein Matcha",
            "Iced Sugar-Free Vanilla Protein Matcha",
            "Iced Banana Cream Protein Matcha",
            "Iced Matcha Latte",
            "Iced Matcha Creme Frappuccino"
        ],
        reviews: [
            { name: "Michelle Tan", rating: 5, text: "Excellent balance of sweetness and matcha depth.", date: "10 months ago", drink: "Iced Protein Matcha" },
            { name: "Eric Daniels", rating: 4, text: "Not as strong as expected for the price.", date: "55 months ago", drink: "Hot Matcha Latte" },
            { name: "Vincent Choi", rating: 4, text: "Decent drink but the portion felt small.", date: "6 months ago", drink: "Iced Sugar-Free Vanilla Protein Matcha" }
        ]
    },
    {
        id: 3,
        name: "Dunkin'",
        image: "images/dunkin.jpg",
        neighborhood: "Northeastern Campus",
        address: "360 Huntington Ave, Boston, MA 02115",
        coords: [42.3395, -71.0885],
        rating: 3.3,
        reviewCount: 9,
        priceLevel: 1,
        distance: 0.0,
        tags: ["Budget Friendly", "Iced Options", "Near Campus"],
        badge: null,
        description: "Located in Northeastern Campus, offering 4 matcha drinks including Iced Matcha Latte, Iced Wicked Green Matcha, Hot Matcha Latte.",
        hours: "06:30 - 19:00",
        drinks: [
            "Iced Matcha Latte",
            "Iced Wicked Green Matcha",
            "Hot Matcha Latte",
            "Frozen Matcha Latte"
        ],
        reviews: [
            { name: "Christopher Hale", rating: 5, text: "Freshly whisked and vibrant color, highly recommend.", date: "2 months ago", drink: "Iced Matcha Latte" },
            { name: "Damien Wells", rating: 4, text: "Nice balance of matcha and milk, would get again.", date: "31 months ago", drink: "Hot Matcha Latte" },
            { name: "Natalie Evans", rating: 4, text: "Nice balance of matcha and milk, would get again.", date: "23 months ago", drink: "Hot Matcha Latte" }
        ]
    },
    {
        id: 4,
        name: "Saxbys",
        image: "images/saxbys.jpg",
        neighborhood: "Northeastern Campus",
        address: "815 Columbus Ave, Boston, MA 02120",
        coords: [42.3371, -71.0875],
        rating: 3.8,
        reviewCount: 17,
        priceLevel: 2,
        distance: 0.3,
        tags: ["Creative Flavors", "Iced Options", "Near Campus"],
        badge: null,
        description: "Located in Northeastern Campus, offering 7 matcha drinks including Hot Matcha Latte, Iced Matcha Latte, Iced Strawberry Matcha Latte.",
        hours: "07:30 - 18:00",
        drinks: [
            "Hot Matcha Latte",
            "Iced Matcha Latte",
            "Iced Strawberry Matcha Latte",
            "Iced Vanilla Bean Matcha",
            "Iced Pumpkin Matcha Latte",
            "Iced Ube Matcha Latte",
            "Iced Dark Chocolate Peppermint Mocha Matcha"
        ],
        reviews: [
            { name: "Kira Donovan", rating: 5, text: "Freshly whisked and vibrant color, highly recommend.", date: "6 months ago", drink: "Iced Matcha Latte" },
            { name: "Claire Foster", rating: 5, text: "Excellent balance of sweetness and matcha depth.", date: "2 months ago", drink: "Hot Matcha Latte" },
            { name: "Megan Carter", rating: 4, text: "Nice balance of matcha and milk, would get again.", date: "44 months ago", drink: "Iced Vanilla Bean Matcha" }
        ]
    },
    {
        id: 5,
        name: "The Sipping Room by Breeze",
        image: "images/sipping.jpg",
        neighborhood: "Fenway",
        address: "132 Jersey St, Boston, MA 02215",
        coords: [42.3424, -71.0966],
        rating: 4.5,
        reviewCount: 2,
        priceLevel: 2,
        distance: 0.6,
        tags: ["Top Rated", "Iced Options"],
        badge: "Top Pick",
        description: "Located in Fenway, offering 1 matcha drinks including Iced Matcha Latte. Known for quality matcha with consistently positive reviews.",
        hours: "12:00 - 18:00",
        drinks: [
            "Iced Matcha Latte"
        ],
        reviews: [
            { name: "Jessica Meng", rating: 5, text: "tastes really good and cheaper than local competition like Matcha Cafe Maiko and Phinista", date: "1 months ago", drink: "Iced Matcha Latte" },
            { name: "Michelle Tan", rating: 4, text: "Nice spot to study while sipping this.", date: "48 months ago", drink: "Iced Matcha Latte" }
        ]
    },
    {
        id: 6,
        name: "Matcha Cafe Maiko",
        image: "images/maiko.jpg",
        neighborhood: "Fenway",
        address: "115 Jersey St, Boston, MA 02215",
        coords: [42.3427, -71.0971],
        rating: 3.7,
        reviewCount: 46,
        priceLevel: 3,
        distance: 0.6,
        tags: ["Creative Flavors", "Boba & Toppings", "Tea Specialist", "Iced Options"],
        badge: "Popular",
        description: "Located in Fenway, offering 17 matcha drinks including Iced Strawberry Matcha, Iced Sakura Matcha, Iced Matcha Cheese.",
        hours: "13:00 - 21:00",
        drinks: [
            "Iced Strawberry Matcha",
            "Iced Sakura Matcha",
            "Iced Matcha Cheese",
            "Iced Black Sugar Matcha",
            "Iced Red Bean Matcha",
            "Iced Matcha Oreo Frappe",
            "Iced Matcha Yuzu",
            "Iced Matcha Peach",
            "Iced Matcha Latte",
            "Iced Matcha Cream",
            "Iced Matcha Kuromitsu Kinoko",
            "Iced Matcha Kuromitsu Kinoko Cream",
            "Iced Matcha Chocolate",
            "Iced Matcha Chocolate Cream",
            "Iced Matcha",
            "Iced Matcha Lemon",
            "Iced Matcha Frappe"
        ],
        reviews: [
            { name: "Sandra Lin", rating: 5, text: "Excellent balance of sweetness and matcha depth.", date: "28 months ago", drink: "Iced Matcha Cream" },
            { name: "Damien Wells", rating: 5, text: "Freshly whisked and vibrant color, highly recommend.", date: "55 months ago", drink: "Iced Matcha Cheese" },
            { name: "Daniela Cruz", rating: 5, text: "Excellent balance of sweetness and matcha depth.", date: "6 months ago", drink: "Iced Matcha Cream" }
        ]
    },
    {
        id: 7,
        name: "Phinista Cafe",
        image: "images/phinista.jpg",
        neighborhood: "Fenway",
        address: "96 Peterborough St, Boston, MA 02215",
        coords: [42.3431, -71.0993],
        rating: 3.5,
        reviewCount: 10,
        priceLevel: 3,
        distance: 0.8,
        tags: ["Creative Flavors", "Iced Options"],
        badge: null,
        description: "Located in Fenway, offering 4 matcha drinks including Iced Ube Matcha Latte, Iced Strawberry Matcha Latte, Iced Pandan Matcha Latte.",
        hours: "08:00 - 17:00",
        drinks: [
            "Iced Ube Matcha Latte",
            "Iced Strawberry Matcha Latte",
            "Iced Pandan Matcha Latte",
            "Iced Banana Bread Pudding Matcha Latte"
        ],
        reviews: [
            { name: "Jessica Meng", rating: 5, text: "very flavorful and better than competitors like Blank Street and Matcha Cafe Maiko", date: "2 months ago", drink: "Iced Banana Bread Pudding Matcha Latte" },
            { name: "Nathan Foster", rating: 4, text: "Great presentation and Instagram-worthy.", date: "6 months ago", drink: "Iced Ube Matcha Latte" },
            { name: "Nora Blake", rating: 4, text: "Nice spot to study while sipping this.", date: "52 months ago", drink: "Iced Pandan Matcha Latte" }
        ]
    },
    {
        id: 8,
        name: "Flour Bakery + Cafe",
        image: "images/flour.jpg",
        neighborhood: "Back Bay",
        address: "30 Dalton St, Boston, MA 02115",
        coords: [42.3460, -71.0846],
        rating: 4.4,
        reviewCount: 10,
        priceLevel: 1,
        distance: 0.6,
        tags: ["Budget Friendly", "Top Rated", "Iced Options"],
        badge: "Top Pick",
        description: "Located in Back Bay, offering 3 matcha drinks including Hot Matcha Latte, Iced Honeycomb Matcha Latte, Iced Matcha Latte. Known for quality matcha with consistently positive reviews.",
        hours: "07:00 - 19:00",
        drinks: [
            "Hot Matcha Latte",
            "Iced Honeycomb Matcha Latte",
            "Iced Matcha Latte"
        ],
        reviews: [
            { name: "Brandon Nguyen", rating: 5, text: "Excellent balance of sweetness and matcha depth.", date: "24 months ago", drink: "Iced Honeycomb Matcha Latte" },
            { name: "Paul Nguyen", rating: 5, text: "Excellent balance of sweetness and matcha depth.", date: "34 months ago", drink: "Hot Matcha Latte" },
            { name: "Anthony Lopez", rating: 5, text: "Excellent balance of sweetness and matcha depth.", date: "28 months ago", drink: "Hot Matcha Latte" }
        ]
    },
    {
        id: 9,
        name: "Gong Cha",
        image: "images/gongcha.jpg",
        neighborhood: "Back Bay",
        address: "281 Huntington Ave, Boston, MA 02115",
        coords: [42.3420, -71.0864],
        rating: 4.2,
        reviewCount: 6,
        priceLevel: 2,
        distance: 0.2,
        tags: ["Creative Flavors", "Top Rated", "Iced Options"],
        badge: null,
        description: "Located in Back Bay, offering 2 matcha drinks including Iced Matcha Latte, Iced Strawberry Matcha Latte. Known for quality matcha with consistently positive reviews.",
        hours: "11:00 - 22:00",
        drinks: [
            "Iced Matcha Latte",
            "Iced Strawberry Matcha Latte"
        ],
        reviews: [
            { name: "Owen Bradley", rating: 5, text: "Freshly whisked and vibrant color, highly recommend.", date: "10 months ago", drink: "Iced Strawberry Matcha Latte" },
            { name: "Isabel Torres", rating: 4, text: "Too much ice, diluted the drink.", date: "52 months ago", drink: "Iced Matcha Latte" },
            { name: "Ashley Monroe", rating: 4, text: "Good value compared to nearby cafes.", date: "14 months ago", drink: "Iced Strawberry Matcha Latte" }
        ]
    },
    {
        id: 10,
        name: "HEYTEA",
        image: "images/heytea.jpg",
        neighborhood: "Back Bay",
        address: "223 Newbury St, Boston, MA 02116",
        coords: [42.3501, -71.0816],
        rating: 3.8,
        reviewCount: 23,
        priceLevel: 3,
        distance: 1.0,
        tags: ["Boba & Toppings", "Tea Specialist", "Iced Options"],
        badge: null,
        description: "Located in Back Bay, offering 11 matcha drinks including Iced Matcha Cloud Coconut Aqua, Iced Wicked Matcha, Iced Triple Supreme Matcha Latte.",
        hours: "11:00 - 21:00",
        drinks: [
            "Iced Matcha Cloud Coconut Aqua",
            "Iced Wicked Matcha",
            "Iced Triple Supreme Matcha Latte",
            "Iced Matcha Cloud Coconut Blue",
            "Hot Triple Supreme Matcha Latte",
            "Hot Supreme Matcha Latte",
            "Hot Cloud Matcha Latte",
            "Iced Cloud Matcha Latte",
            "Iced Oat Matcha Boba",
            "Iced Supreme Matcha Latte",
            "Iced Pure Matcha"
        ],
        reviews: [
            { name: "Tyler Morgan", rating: 5, text: "Perfect temperature and not overly sweet.", date: "2 months ago", drink: "Iced Matcha Cloud Coconut Blue" },
            { name: "Chloe Kim", rating: 5, text: "Freshly whisked and vibrant color, highly recommend.", date: "6 months ago", drink: "Iced Wicked Matcha" },
            { name: "Jessica Meng", rating: 4, text: "looks nice and tastes good", date: "5 months ago", drink: "Iced Matcha Cloud Coconut Blue" }
        ]
    },
    {
        id: 11,
        name: "Blank Street",
        image: "images/blank.jpg",
        neighborhood: "Back Bay",
        address: "647 Boylston St, Boston, MA 02116",
        coords: [42.3501, -71.0784],
        rating: 3.7,
        reviewCount: 34,
        priceLevel: 2,
        distance: 0.9,
        tags: ["Creative Flavors", "Iced Options"],
        badge: "Popular",
        description: "Located in Back Bay, offering 12 matcha drinks including Iced Carrot Cake Matcha, Iced Banana Bread Matcha, Hot Banana Bread Matcha.",
        hours: "06:30 - 20:00",
        drinks: [
            "Iced Carrot Cake Matcha",
            "Iced Banana Bread Matcha",
            "Hot Banana Bread Matcha",
            "Iced Salted Pistachio Matcha",
            "Iced Strawberry Shortcake Matcha",
            "Hot Strawberry Shortcake Matcha",
            "Iced Daydream Matcha",
            "Hot Daydream Matcha",
            "Iced Blueberry Matcha",
            "Hot Blueberry Matcha",
            "Iced Matcha Latte",
            "Hot Matcha Latte"
        ],
        reviews: [
            { name: "Patrick Kim", rating: 5, text: "Freshly whisked and vibrant color, highly recommend.", date: "25 months ago", drink: "Hot Daydream Matcha" },
            { name: "Connor Casey", rating: 5, text: "Excellent balance of sweetness and matcha depth.", date: "30 months ago", drink: "Hot Strawberry Shortcake Matcha" },
            { name: "Owen Bradley", rating: 5, text: "Excellent balance of sweetness and matcha depth.", date: "2 months ago", drink: "Hot Daydream Matcha" }
        ]
    },
    {
        id: 12,
        name: "Jaho Coffee Roaster & Wine Bar",
        image: "images/jaho.jpg",
        neighborhood: "Back Bay",
        address: "116 Huntington Ave, Boston, MA 02116",
        coords: [42.3468, -71.0796],
        rating: 3.5,
        reviewCount: 13,
        priceLevel: 2,
        distance: 0.7,
        tags: ["Creative Flavors", "Iced Options"],
        badge: null,
        description: "Located in Back Bay, offering 7 matcha drinks including Hot Black Sugar Matcha Latte, Hot Blossom Matcha Latte, Hot Matcha Latte.",
        hours: "06:30 - 23:00",
        drinks: [
            "Hot Black Sugar Matcha Latte",
            "Hot Blossom Matcha Latte",
            "Hot Matcha Latte",
            "Hot Strawberry Matcha Latte",
            "Iced Strawberry Matcha Latte",
            "Iced Black Sugar Matcha Latte",
            "Iced Matcha Latte"
        ],
        reviews: [
            { name: "Daniel Rivera", rating: 5, text: "Excellent balance of sweetness and matcha depth.", date: "18 months ago", drink: "Iced Matcha Latte" },
            { name: "Lila Stewart", rating: 4, text: "Could taste the quality of the tea leaves.", date: "42 months ago", drink: "Hot Blossom Matcha Latte" },
            { name: "Justin Kim", rating: 4, text: "Nice balance of matcha and milk, would get again.", date: "47 months ago", drink: "Iced Strawberry Matcha Latte" }
        ]
    },
    {
        id: 13,
        name: "Green Haus Cafe",
        image: "images/green.jpg",
        neighborhood: "Fenway",
        address: "1520 Tremont St, Boston, MA 02120",
        coords: [42.3322, -71.0997],
        rating: 3.7,
        reviewCount: 6,
        priceLevel: 2,
        distance: 0.9,
        tags: ["Creative Flavors", "Iced Options"],
        badge: null,
        description: "Located in Fenway, offering 3 matcha drinks including Hot Matcha Latte, Iced Matcha Latte, Iced Strawberry Matcha Latte.",
        hours: "07:30 - 17:00",
        drinks: [
            "Hot Matcha Latte",
            "Iced Matcha Latte",
            "Iced Strawberry Matcha Latte"
        ],
        reviews: [
            { name: "Caroline Yu", rating: 4, text: "Good value compared to nearby cafes.", date: "33 months ago", drink: "Hot Matcha Latte" },
            { name: "Henry Collins", rating: 4, text: "Nice balance of matcha and milk, would get again.", date: "29 months ago", drink: "Iced Matcha Latte" },
            { name: "Hannah Lewis", rating: 4, text: "Freshly whisked and vibrant color, highly recommend.", date: "2 months ago", drink: "Iced Strawberry Matcha Latte" }
        ]
    },
    {
        id: 14,
        name: "Pavement Coffeehouse",
        image: "images/pavement.jpg",
        neighborhood: "Northeastern Campus",
        address: "44 Gainsborough St, Boston, MA 02115",
        coords: [42.3417, -71.0870],
        rating: 4.7,
        reviewCount: 3,
        priceLevel: 2,
        distance: 0.3,
        tags: ["Top Rated", "Iced Options", "Near Campus"],
        badge: "Top Pick",
        description: "Located in Northeastern Campus, offering 2 matcha drinks including Hot Matcha Latte, Iced Matcha Latte. Known for quality matcha with consistently positive reviews.",
        hours: "07:00 - 18:00",
        drinks: [
            "Hot Matcha Latte",
            "Iced Matcha Latte"
        ],
        reviews: [
            { name: "Kayla Johnson", rating: 5, text: "Excellent balance of sweetness and matcha depth.", date: "13 months ago", drink: "Hot Matcha Latte" },
            { name: "Zoe Harper", rating: 5, text: "Excellent balance of sweetness and matcha depth.", date: "16 months ago", drink: "Iced Matcha Latte" },
            { name: "Anthony Lopez", rating: 4, text: "Nice balance of matcha and milk, would get again.", date: "24 months ago", drink: "Iced Matcha Latte" }
        ]
    },
    {
        id: 15,
        name: "Ten One Tea House",
        image: "images/tenone.jpg",
        neighborhood: "Back Bay",
        address: "1323 Boylston St, Boston, MA 02215",
        coords: [42.3444, -71.0993],
        rating: 3.9,
        reviewCount: 7,
        priceLevel: 2,
        distance: 0.8,
        tags: ["Tea Specialist", "Iced Options"],
        badge: null,
        description: "Located in Back Bay, offering 2 matcha drinks including Iced Matcha Latte, Hot Matcha Latte.",
        hours: "12:00 - 21:00",
        drinks: [
            "Iced Matcha Latte",
            "Hot Matcha Latte"
        ],
        reviews: [
            { name: "Olivia Brooks", rating: 5, text: "Excellent balance of sweetness and matcha depth.", date: "29 months ago", drink: "Hot Matcha Latte" },
            { name: "Colin Barrett", rating: 4, text: "Could taste the quality of the tea leaves.", date: "34 months ago", drink: "Hot Matcha Latte" },
            { name: "Jonathan Flores", rating: 4, text: "Good value compared to nearby cafes.", date: "26 months ago", drink: "Iced Matcha Latte" }
        ]
    },
    {
        id: 16,
        name: "Kyo Matcha",
        image: "images/kyo.jpg",
        neighborhood: "Brookline",
        address: "1010 Beacon St, Brookline, MA 02446",
        coords: [42.3463, -71.1074],
        rating: 3.8,
        reviewCount: 37,
        priceLevel: 3,
        distance: 1.4,
        tags: ["Creative Flavors", "Boba & Toppings", "Tea Specialist", "Iced Options"],
        badge: "Popular",
        description: "Located in Brookline, offering 17 matcha drinks including Iced Matcha Latte, Iced Lavender Matcha Latte, Iced Brown Sugar Boba Matcha Latte.",
        hours: "11:30 - 22:00",
        drinks: [
            "Iced Matcha Latte",
            "Iced Lavender Matcha Latte",
            "Iced Brown Sugar Boba Matcha Latte",
            "Iced White Peach Matcha Latte",
            "Iced Banana Matcha Latte",
            "Iced Jasmine Matcha Latte",
            "Iced Black Sesame Latte",
            "Iced Mango Matcha Latte",
            "Iced Matcha Mocha",
            "Iced Soymilk Matcha Latte",
            "Iced Strawberry Matcha Latte",
            "Iced Red Bean Matcha Latte",
            "Iced Matcha",
            "Iced Jasmine Matcha Cream",
            "Iced Matcha Lemonade",
            "Iced Brulee Cream Matcha Slush",
            "Iced Red Bean Matcha Slush"
        ],
        reviews: [
            { name: "Jessica Meng", rating: 5, text: "very flavorful and unique", date: "2 months ago", drink: "Iced White Peach Matcha Latte" },
            { name: "Nicole Garcia", rating: 5, text: "Could taste the quality of the tea leaves.", date: "15 months ago", drink: "Iced Banana Matcha Latte" },
            { name: "Zoe Harper", rating: 5, text: "Excellent balance of sweetness and matcha depth.", date: "31 months ago", drink: "Iced Black Sesame Latte" }
        ]
    }
];
