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
  background: #111111;
  color: #f0f0f0;
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
  border-top: 1px solid #2a2a2a;
  font-size: 0.7rem;
  color: #3a3a3a;
}

.footer-conf {
  font-variant: small-caps;
  letter-spacing: 0.05em;
}
</style>
