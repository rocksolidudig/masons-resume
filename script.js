(() => {
  const filters = [...document.querySelectorAll('[data-filter]')];
  const cards = [...document.querySelectorAll('[data-category]')];
  filters.forEach(button => button.addEventListener('click', () => {
    const value = button.dataset.filter;
    filters.forEach(b => { const current = b === button; b.classList.toggle('active', current); b.setAttribute('aria-pressed', String(current)); });
    cards.forEach(card => { card.hidden = value !== 'all' && card.dataset.category !== value; });
  }));
  const theme = document.getElementById('theme');
  theme?.addEventListener('click', () => {
    const next = document.documentElement.dataset.theme === 'dark' ? 'light' : 'dark';
    document.documentElement.dataset.theme = next;
    theme.setAttribute('aria-label', `Switch to ${next === 'dark' ? 'light' : 'dark'} theme`);
  });
})();
