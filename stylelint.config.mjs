/** @type {import('stylelint').Config} */
export default {
  extends: [
    'stylelint-config-standard-scss',
    'stylelint-config-recommended-vue/scss',
  ],
  overrides: [
    {
      files: ['**/*.{vue,html}'],
      customSyntax: 'postcss-html',
    },
    {
      files: ['**/*.{css,scss}'],
      customSyntax: 'postcss-scss',
    },
  ],
  ignoreFiles: [
    'node_modules/**',
    '.nuxt/**',
    '.output/**',
    'dist/**',
    'storybook-static/**',
    'public/**',
    'backend/**',
    '**/*.min.css',
  ],
  rules: {
    // Vue / Nuxt / Quasar
    'selector-pseudo-class-no-unknown': [
      true,
      {
        ignorePseudoClasses: ['deep', 'global', 'slotted'],
      },
    ],
    'selector-pseudo-element-no-unknown': [
      true,
      {
        ignorePseudoElements: ['v-deep', 'v-global', 'v-slotted'],
      },
    ],
    'selector-type-no-unknown': [
      true,
      {
        ignore: ['custom-elements'],
        ignoreTypes: ['/^q-/', '/^Nuxt/', '/^Router/'],
      },
    ],

    // Существующий стиль проекта (BEM-like, SCSS)
    'selector-class-pattern': null,
    'custom-property-pattern': null,
    'keyframes-name-pattern': null,
    'scss/at-mixin-pattern': null,
    'scss/at-function-pattern': null,
    'scss/dollar-variable-pattern': null,
    'scss/percent-placeholder-pattern': null,

    'no-descending-specificity': null,
    'no-empty-source': null,
    'scss/comment-no-empty': null,

    'import-notation': null,
    'color-function-notation': null,
    'color-function-alias-notation': null,
    'alpha-value-notation': null,
    'media-feature-range-notation': null,
    'declaration-block-no-redundant-longhand-properties': null,
    'declaration-empty-line-before': null,
    'rule-empty-line-before': null,
    'custom-property-empty-line-before': null,
    'shorthand-property-no-redundant-values': null,
    'property-no-vendor-prefix': null,
    'value-no-vendor-prefix': null,
    'selector-no-vendor-prefix': null,
    'font-family-name-quotes': null,
    'function-url-quotes': 'always',
    'value-keyword-case': null,
    'selector-not-notation': null,
    'color-hex-length': null,
    'property-no-deprecated': null,
    'comment-empty-line-before': null,
    'at-rule-empty-line-before': null,
    'declaration-property-value-keyword-no-deprecated': null,

    'max-nesting-depth': [
      5,
      {
        ignore: ['blockless-at-rules', 'pseudo-classes'],
      },
    ],
  },
}
