local m = require('plugins.snippets.shorthands')

return {
  m.s('competitive', {
    m.t({
      '#include <bits/stdc++.h>',
      'using namespace std;',
      '#define ll long long',
      '#define INF  numeric_limits<ll>::max()',
      '#define NINF  numeric_limits<ll>::min()',
      '',
      'int main() {',
      '\t',
    }),
    m.i(0),
    m.t({
      '',
      '',
      '\treturn 0;',
      '}',
    })
  }),
  m.s('cf', {
    m.t({
      'll t;',
      'cin >> t;',
      '',
      'while (t--) {',
      '\t'
    }),
    m.i(0),
    m.t({
      '',
      '}'
    })
  })
}
