// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import * as ActiveStorage from "@rails/activestorage";
ActiveStorage.start();

// Apply saved theme early
const rootElement = document.documentElement;
try {
	const savedTheme = localStorage.getItem("theme");
	if (savedTheme === "dark") {
		rootElement.classList.add("dark");
	} else if (savedTheme === "light") {
		rootElement.classList.remove("dark");
	} else if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
		rootElement.classList.add("dark");
	}
} catch (_) {}

function initThemeToggle() {
	const toggleButton = document.getElementById("theme-toggle");
	if (!toggleButton) {
		console.log("Theme toggle button not found");
		return;
	}

	console.log("Theme toggle button found, adding event listener");

	// Remove existing event listeners to prevent duplicates
	toggleButton.replaceWith(toggleButton.cloneNode(true));
	const newToggleButton = document.getElementById("theme-toggle");

	newToggleButton.addEventListener("click", (e) => {
		console.log("Theme toggle clicked");
		e.preventDefault();
		const isDark = rootElement.classList.toggle("dark");
		console.log("Dark mode:", isDark);
		try {
			localStorage.setItem("theme", isDark ? "dark" : "light");
		} catch (error) {
			console.error("Error saving theme:", error);
		}
	});
}

// Handle both initial load and Turbo navigation
document.addEventListener("DOMContentLoaded", () => {
	console.log("DOMContentLoaded fired");
	initThemeToggle();
});

document.addEventListener("turbo:load", () => {
	console.log("turbo:load fired");
	initThemeToggle();
});

console.log("Application.js loaded");
