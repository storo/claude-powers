# Performance Turbo Command

Optimización automática de rendimiento usando IA avanzada para alcanzar performance perfecta sin esfuerzo manual.

## Descripción

El comando `/performance-turbo` lleva el rendimiento de tu aplicación al siguiente nivel:

- **Análisis automático** de bottlenecks y oportunidades de optimización
- **Optimizaciones inteligentes** que preservan funcionalidad
- **Bundle optimization** automática para web apps
- **Database query optimization** para backend
- **Memory management** y prevención de leaks
- **Lazy loading** automático de recursos
- **Caching strategies** optimizadas por IA
- **Performance monitoring** integrado
- **Web Vitals optimization** para SEO y UX
- **Real-time suggestions** durante desarrollo

## Usage

```
/performance-turbo [directory] [--target] [--focus] [--budget] [--mode]
```

### Parámetros

- `directory`: directory específico a optimizar
- `--target`: Plataforma objetivo (web, mobile, desktop, ssr)
- `--focus`: Área de foco (bundle, runtime, memory, network, database)
- `--budget`: Performance budget (strict, moderate, relaxed)
- `--mode`: Modo de optimización (safe, aggressive, experimental)
- `--preserve`: Preservar funcionalidad específica
- `--metrics`: Métricas objetivo (lcp, fid, cls, ttfb)
- `--baseline`: Comparar con baseline anterior

### Examples

```
/performance-turbo
/performance-turbo src/ --target=web --focus=bundle --budget=strict
/performance-turbo backend/ --focus=database --mode=aggressive
/performance-turbo --target=mobile --metrics=lcp,fid --budget=strict
/performance-turbo components/ --focus=runtime --mode=safe
/performance-turbo api/ --focus=network --preserve=backward-compatibility
```

## Optimizaciones Automáticas

### ⚡ Bundle Optimization
```javascript
// ❌ ANTES - Bundle no optimizado
import { entireLibrary } from 'heavy-library';
import './styles.css';
import './unused-styles.css';

const MyComponent = () => {
  const [data, setData] = useState([]);
  
  useEffect(() => {
    entireLibrary.fetchData().then(setData);
  }, []);
  
  return (
    <div className="container">
      {data.map(item => (
        <HeavyComponent key={item.id} item={item} />
      ))}
    </div>
  );
};

// ✅ DESPUÉS - Bundle optimizado automáticamente
import { fetchData } from 'heavy-library/fetch-only'; // Tree-shaking aplicado
import './styles.css'; // unused-styles.css removido automáticamente

const MyComponent = () => {
  const [data, setData] = useState([]);
  
  useEffect(() => {
    fetchData().then(setData);
  }, []);
  
  // Virtualización agregada automáticamente para listas grandes
  return (
    <VirtualizedList 
      items={data}
      renderItem={({ item }) => (
        <Suspense fallback={<ItemSkeleton />}>
          <HeavyComponent item={item} />
        </Suspense>
      )}
      className="container"
    />
  );
};

// Code splitting agregado automáticamente
const HeavyComponent = lazy(() => 
  import('./HeavyComponent').then(module => ({
    default: module.HeavyComponent
  }))
);
```

### 🧠 Memory Optimization
```javascript
// ❌ ANTES - Memory inefficient
const DataProcessor = ({ items }) => {
  const [processedData, setProcessedData] = useState([]);
  const [cache, setCache] = useState({});
  
  const processItems = useCallback(() => {
    // Crea nuevos objetos en cada render
    const processed = items.map(item => ({
      ...item,
      processed: heavyComputation(item),
      timestamp: Date.now()
    }));
    setProcessedData(processed);
  }, [items]);
  
  return (
    <div>
      {processedData.map(item => (
        <ItemComponent key={item.id} item={item} />
      ))}
    </div>
  );
};

// ✅ DESPUÉS - Memory optimizado automáticamente
const DataProcessor = ({ items }) => {
  // Memoización inteligente agregada
  const processedData = useMemo(() => {
    return items.map(item => ({
      ...item,
      processed: heavyComputation(item)
    }));
  }, [items]);
  
  // Cache LRU agregado automáticamente
  const memoizedHeavyComputation = useMemo(() => 
    memoize(heavyComputation, { maxSize: 100 }), []
  );
  
  // Virtualization para listas grandes
  const virtualizedItems = useVirtualization(processedData, {
    itemHeight: 60,
    overscan: 5
  });
  
  return (
    <VirtualizedContainer>
      {virtualizedItems.map(({ item, index, style }) => (
        <div key={item.id} style={style}>
          <MemoizedItemComponent item={item} />
        </div>
      ))}
    </VirtualizedContainer>
  );
};

// Componente memoizado automáticamente
const MemoizedItemComponent = memo(ItemComponent, (prev, next) => 
  prev.item.id === next.item.id && 
  prev.item.version === next.item.version
);
```

### 🌐 Network Optimization
```javascript
// ❌ ANTES - Network inefficient
const UserProfile = ({ userId }) => {
  const [user, setUser] = useState(null);
  const [posts, setPosts] = useState([]);
  const [comments, setComments] = useState([]);
  
  useEffect(() => {
    // Múltiples requests secuenciales
    fetchUser(userId).then(setUser);
    fetchUserPosts(userId).then(setPosts);
    fetchUserComments(userId).then(setComments);
  }, [userId]);
  
  return (
    <div>
      <UserInfo user={user} />
      <UserPosts posts={posts} />
      <UserComments comments={comments} />
    </div>
  );
};

// ✅ DESPUÉS - Network optimizado automáticamente
const UserProfile = ({ userId }) => {
  // GraphQL agregado automáticamente para single request
  const { data, loading, error } = useQuery(GET_USER_PROFILE, {
    variables: { userId },
    // Cache optimizado automáticamente
    fetchPolicy: 'cache-first',
    // Prefetch relacionado
    onCompleted: (data) => {
      // Prefetch user connections
      prefetchUserConnections(data.user.id);
    }
  });
  
  // Loading states optimizados
  if (loading) return <UserProfileSkeleton />;
  if (error) return <ErrorBoundary error={error} />;
  
  const { user, posts, comments } = data;
  
  return (
    <div>
      <UserInfo user={user} />
      {/* Lazy loading agregado automáticamente */}
      <Suspense fallback={<PostsSkeleton />}>
        <LazyUserPosts posts={posts} />
      </Suspense>
      <Suspense fallback={<CommentsSkeleton />}>
        <LazyUserComments comments={comments} />
      </Suspense>
    </div>
  );
};

// Service Worker agregado para caching
const cacheStrategy = new CacheFirst({
  cacheName: 'user-profiles',
  plugins: [{
    // Cache invalidation inteligente
    cacheWillUpdate: async ({ response }) => 
      response.status === 200 && response.headers.get('content-type')?.includes('application/json')
  }]
});
```

### 🗄️ Database Optimization
```javascript
// ❌ ANTES - Database inefficient
const getUsersWithPosts = async () => {
  const users = await User.findAll(); // N+1 query problem
  
  const usersWithPosts = await Promise.all(
    users.map(async user => {
      const posts = await Post.findAll({ where: { userId: user.id } });
      return { ...user.toJSON(), posts };
    })
  );
  
  return usersWithPosts;
};

// ✅ DESPUÉS - Database optimizado automáticamente
const getUsersWithPosts = async () => {
  // Eager loading agregado automáticamente
  const users = await User.findAll({
    include: [{
      model: Post,
      // Límite agregado para evitar over-fetching
      limit: 10,
      order: [['createdAt', 'DESC']],
      // Selección de campos optimizada
      attributes: ['id', 'title', 'summary', 'createdAt']
    }],
    // Índices sugeridos automáticamente
    attributes: ['id', 'name', 'email', 'avatarUrl'],
    // Paginación agregada automáticamente
    limit: 50,
    offset: 0
  });
  
  return users;
};

// Índices automáticamente sugeridos
/*
CREATE INDEX CONCURRENTLY idx_posts_user_created 
ON posts (user_id, created_at DESC) 
WHERE deleted_at IS NULL;

CREATE INDEX CONCURRENTLY idx_users_active
ON users (id, name, email) 
WHERE active = true;
*/

// Cache layer agregado automáticamente
const getCachedUsersWithPosts = async () => {
  const cacheKey = 'users_with_posts_v1';
  
  let cached = await redis.get(cacheKey);
  if (cached) return JSON.parse(cached);
  
  const users = await getUsersWithPosts();
  await redis.setex(cacheKey, 300, JSON.stringify(users)); // 5 min cache
  
  return users;
};
```

### 🎨 Rendering Optimization
```javascript
// ❌ ANTES - Rendering inefficient
const Dashboard = ({ filters, sortBy, searchTerm }) => {
  const [data, setData] = useState([]);
  
  // Re-render en cada prop change
  const filteredData = data
    .filter(item => item.category === filters.category)
    .filter(item => item.name.includes(searchTerm))
    .sort((a, b) => a[sortBy] - b[sortBy]);
  
  return (
    <div>
      {filteredData.map(item => (
        <ItemCard 
          key={item.id} 
          item={item}
          onUpdate={() => updateItem(item.id)}
        />
      ))}
    </div>
  );
};

// ✅ DESPUÉS - Rendering optimizado automáticamente
const Dashboard = ({ filters, sortBy, searchTerm }) => {
  const [data, setData] = useState([]);
  
  // Memoización de computaciones costosas
  const filteredData = useMemo(() => {
    return data
      .filter(item => item.category === filters.category)
      .filter(item => item.name.toLowerCase().includes(searchTerm.toLowerCase()))
      .sort((a, b) => {
        const aVal = a[sortBy];
        const bVal = b[sortBy];
        return typeof aVal === 'string' ? aVal.localeCompare(bVal) : aVal - bVal;
      });
  }, [data, filters.category, searchTerm, sortBy]);
  
  // Callback memoizado
  const handleUpdate = useCallback((itemId) => {
    updateItem(itemId);
  }, []);
  
  // Virtualization para listas grandes
  const rowRenderer = useCallback(({ index, key, style }) => (
    <div key={key} style={style}>
      <MemoizedItemCard 
        item={filteredData[index]}
        onUpdate={handleUpdate}
      />
    </div>
  ), [filteredData, handleUpdate]);
  
  return (
    <AutoSizer>
      {({ height, width }) => (
        <FixedSizeList
          height={height}
          width={width}
          itemCount={filteredData.length}
          itemSize={120}
          itemData={filteredData}
        >
          {rowRenderer}
        </FixedSizeList>
      )}
    </AutoSizer>
  );
};

// Componente memoizado con shallow comparison inteligente
const MemoizedItemCard = memo(ItemCard, (prevProps, nextProps) => {
  return (
    prevProps.item.id === nextProps.item.id &&
    prevProps.item.updatedAt === nextProps.item.updatedAt
  );
});
```

## Configuración

`.claude/performance-turbo-config.json`:

```json
{
  "budgets": {
    "strict": {
      "bundleSize": "250KB",
      "firstContentfulPaint": "1.5s",
      "largestContentfulPaint": "2.5s",
      "firstInputDelay": "100ms",
      "cumulativeLayoutShift": "0.1",
      "totalBlockingTime": "200ms"
    },
    "moderate": {
      "bundleSize": "500KB",
      "firstContentfulPaint": "2.5s",
      "largestContentfulPaint": "4s",
      "firstInputDelay": "200ms",
      "cumulativeLayoutShift": "0.15",
      "totalBlockingTime": "400ms"
    },
    "relaxed": {
      "bundleSize": "1MB",
      "firstContentfulPaint": "3s",
      "largestContentfulPaint": "5s",
      "firstInputDelay": "300ms",
      "cumulativeLayoutShift": "0.25",
      "totalBlockingTime": "600ms"
    }
  },
  "optimizations": {
    "bundle": {
      "enabled": true,
      "treeshaking": true,
      "codeSplitting": true,
      "dynamicImports": true,
      "minification": true,
      "compression": "gzip",
      "unusedCodeElimination": true
    },
    "runtime": {
      "enabled": true,
      "memoization": true,
      "virtualization": true,
      "lazyLoading": true,
      "asyncComponents": true,
      "renderOptimization": true
    },
    "memory": {
      "enabled": true,
      "leakDetection": true,
      "cacheOptimization": true,
      "garbageCollection": true,
      "objectPooling": false
    },
    "network": {
      "enabled": true,
      "requestBatching": true,
      "caching": true,
      "compression": true,
      "prefetching": true,
      "serviceWorker": true
    },
    "database": {
      "enabled": true,
      "queryOptimization": true,
      "indexSuggestions": true,
      "connectionPooling": true,
      "cachingLayer": true,
      "eagerLoading": true
    }
  },
  "targets": {
    "web": {
      "focus": ["bundle", "runtime", "network"],
      "frameworks": ["react", "vue", "angular"],
      "metrics": ["lcp", "fid", "cls"]
    },
    "mobile": {
      "focus": ["memory", "battery", "network"],
      "constraints": "low-end-devices",
      "metrics": ["tti", "fcp", "memory"]
    },
    "ssr": {
      "focus": ["ttfb", "hydration", "caching"],
      "metrics": ["ttfb", "fcp", "tti"]
    }
  },
  "monitoring": {
    "realtime": true,
    "webVitals": true,
    "customMetrics": true,
    "performanceObserver": true,
    "resourceTiming": true
  }
}
```

## Salida del Comando

### Análisis de Performance
```
⚡ CLAUDE POWER - PERFORMANCE TURBO ANALYSIS
===========================================

📊 PERFORMANCE BASELINE:
┌─────────────────────────┬─────────┬─────────┬─────────┐
│ Métrica                 │ Actual  │ Target  │ Status  │
├─────────────────────────┼─────────┼─────────┼─────────┤
│ Bundle Size             │ 847KB   │ 250KB   │ ❌ 238% │
│ First Contentful Paint  │ 3.2s    │ 1.5s    │ ❌ 213% │
│ Largest Contentful Paint│ 4.8s    │ 2.5s    │ ❌ 192% │
│ First Input Delay       │ 180ms   │ 100ms   │ ❌ 180% │
│ Cumulative Layout Shift │ 0.23    │ 0.1     │ ❌ 230% │
│ Total Blocking Time     │ 520ms   │ 200ms   │ ❌ 260% │
└─────────────────────────┴─────────┴─────────┴─────────┘

🔍 BOTTLENECKS IDENTIFICADOS:
• Large JavaScript bundles (40% del problema)
• Unoptimized images (25% del problema)
• Excessive re-renders (20% del problema)  
• Inefficient database queries (10% del problema)
• Poor caching strategy (5% del problema)

🎯 OPORTUNIDADES DE OPTIMIZACIÓN:
• Bundle splitting: -65% bundle size potential
• Image optimization: -40% load time potential
• Code memoization: -50% re-renders potential
• Query optimization: -70% database time potential
• Cache implementation: -80% repeat load time potential
```

### Optimizaciones Aplicadas
```
⚡ OPTIMIZACIONES APLICADAS AUTOMÁTICAMENTE:
==========================================

📦 BUNDLE OPTIMIZATION:
✅ Tree-shaking aplicado a 23 librerías
✅ Code splitting en 15 rutas principales
✅ Dynamic imports para 8 componentes pesados
✅ Dead code elimination: 234KB removidos
✅ Minification y compression: -45% size

📊 RESULTADOS BUNDLE:
• Antes: 847KB → Después: 287KB (-66%)
• Chunks generados: 12 (vs 1 monolítico)
• Load time inicial: 3.2s → 1.4s (-56%)

🧠 MEMORY OPTIMIZATION:
✅ Memoization agregada a 34 componentes
✅ Virtualization en 6 listas largas
✅ Memory leak fixes en 8 componentes
✅ Cache LRU implementado en 12 funciones

📊 RESULTADOS MEMORY:
• Memory usage: -42% promedium
• GC frequency: -35% collections
• Retained size: -50% improvement

🌐 NETWORK OPTIMIZATION:
✅ Request batching en 15 endpoints
✅ GraphQL agregado para eliminar over-fetching
✅ Service Worker cache strategy implementada
✅ Image lazy loading en 45 componentes
✅ Resource prefetching inteligente

📊 RESULTADOS NETWORK:
• Network requests: -60% reduction
• Cache hit rate: 85% improvement
• Image load time: -70% improvement

🗄️ DATABASE OPTIMIZATION:
✅ 12 queries optimizadas con eager loading
✅ 8 índices sugeridos e implementados
✅ Connection pooling configurado
✅ Redis cache layer agregado

📊 RESULTADOS DATABASE:
• Query time: -75% promedium
• Database connections: -50% usage
• Cache hit rate: 92% on frequent queries

📈 PERFORMANCE FINAL:
┌─────────────────────────┬─────────┬─────────┬─────────┐
│ Métrica                 │ Antes   │ Después │ Mejora  │
├─────────────────────────┼─────────┼─────────┼─────────┤
│ Bundle Size             │ 847KB   │ 287KB   │ ✅ -66% │
│ First Contentful Paint  │ 3.2s    │ 1.4s    │ ✅ -56% │
│ Largest Contentful Paint│ 4.8s    │ 2.1s    │ ✅ -56% │
│ First Input Delay       │ 180ms   │ 85ms    │ ✅ -53% │
│ Cumulative Layout Shift │ 0.23    │ 0.08    │ ✅ -65% │
│ Total Blocking Time     │ 520ms   │ 165ms   │ ✅ -68% │
└─────────────────────────┴─────────┴─────────┴─────────┘

🏆 LIGHTHOUSE SCORE:
• Performance: 45 → 94 (+109%)
• Accessibility: 87 → 95 (+9%)
• Best Practices: 78 → 96 (+23%)
• SEO: 92 → 98 (+7%)
• PWA: N/A → 85 (Nuevo)

💰 BUSINESS IMPACT:
• Page load speed: +156% improvement
• User engagement: +34% estimated increase
• SEO ranking: +12% potential boost
• Conversion rate: +18% estimated increase
• Server costs: -25% reduction
```

### Monitoring Setup
```
📊 PERFORMANCE MONITORING CONFIGURADO:
=====================================

📈 REAL-TIME METRICS:
• Web Vitals tracking habilitado
• Custom performance marks agregados
• User experience monitoring activado
• Error tracking con performance context

🎯 ALERTAS CONFIGURADAS:
• LCP > 2.5s (Critical)
• FID > 100ms (Warning)  
• CLS > 0.1 (Warning)
• Bundle size > 300KB (Warning)
• Memory usage > 100MB (Critical)

📊 DASHBOARDS:
• Performance dashboard en Grafana
• Real-time monitoring en DataDog
• Weekly performance reports
• Regression detection automática

🔔 NOTIFICACIONES:
• Slack alerts para regressions
• Email reports semanales
• GitHub PR performance comments
• Automated performance budgets
```

## Integración Avanzada

### GitHub Actions
```yaml
name: Performance Turbo

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  performance-optimization:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Node.js
        uses: actions/setup-node@v3
        
      - name: Install dependencies
        run: npm ci
        
      - name: Run performance optimization
        run: |
          npx claude-power performance-turbo \
            --target=web \
            --budget=strict \
            --mode=safe \
            --output=json > performance-results.json
            
      - name: Run Lighthouse CI
        run: |
          npm run build
          npx lhci autorun
          
      - name: Performance Budget Check
        run: |
          BUNDLE_SIZE=$(du -s dist/ | cut -f1)
          if [ $BUNDLE_SIZE -gt 300 ]; then
            echo "❌ Bundle size exceeds budget: ${BUNDLE_SIZE}KB > 300KB"
            exit 1
          fi
          
      - name: Comment PR with results
        uses: actions/github-script@v6
        with:
          script: |
            const fs = require('fs');
            const results = JSON.parse(fs.readFileSync('performance-results.json'));
            
            const comment = `
            ## ⚡ Performance Optimization Results
            
            ### 📊 Metrics Improvement:
            | Metric | Before | After | Improvement |
            |--------|--------|-------|-------------|
            | Bundle Size | ${results.before.bundleSize} | ${results.after.bundleSize} | ${results.improvement.bundleSize} |
            | FCP | ${results.before.fcp} | ${results.after.fcp} | ${results.improvement.fcp} |
            | LCP | ${results.before.lcp} | ${results.after.lcp} | ${results.improvement.lcp} |
            
            ### 🎯 Lighthouse Score: ${results.lighthouse.performance}/100
            
            ${results.lighthouse.performance >= 90 ? '✅' : '⚠️'} Performance Score
            `;
            
            github.rest.issues.createComment({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              body: comment
            });
```

---

*Parte del ecosistema **Claude Power** - Performance perfecta automáticamente* ⚡🚀 
