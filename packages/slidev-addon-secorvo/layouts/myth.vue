<template>
  <div class="myth-layout">
    <!-- Badge oben links -->
    <div
      class="myth-badge"
      :class="$frontmatter.moduleType === 'fail' ? 'badge-fail' : 'badge-myth'"
    >
      <span class="badge-label">{{ $frontmatter.moduleType === 'fail' ? 'FAIL' : 'MYTHOS' }}</span>
      <span class="badge-number">{{ $frontmatter.moduleNo }}</span>
    </div>

    <!-- Haupt-Inhalt -->
    <div class="myth-content">
      <slot />
    </div>

    <!-- Footer -->
    <div class="myth-footer">
      <span class="footer-title">{{ $frontmatter.moduleTitle }}</span>
      <span class="footer-conf">heise secIT 2026</span>
    </div>
  </div>
</template>


<style scoped>
.myth-layout {
  position: relative;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  padding: 2.5rem 3rem 2rem;
  background: #1a1a2e;
}

.myth-badge {
  position: absolute;
  top: 1.5rem;
  right: 2rem;
  display: flex;
  align-items: center;
  gap: 0.4rem;
  padding: 0.3rem 0.8rem;
  border-radius: 4px;
  font-size: 0.75rem;
  font-weight: 700;
  letter-spacing: 0.1em;
}

.badge-myth {
  background: #e63946;
  color: white;
}

.badge-fail {
  background: #f4a261;
  color: #1a1a1a;
}

.badge-label {
  text-transform: uppercase;
}

.badge-number {
  font-size: 1rem;
}

.myth-content {
  flex: 1;
  overflow: hidden;
}

.myth-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-top: 0.75rem;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  font-size: 0.7rem;
  color: rgba(255, 255, 255, 0.35);
}

.footer-conf {
  font-variant: small-caps;
  letter-spacing: 0.05em;
}
</style>
