<template>
  <div class="myth-layout">

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
