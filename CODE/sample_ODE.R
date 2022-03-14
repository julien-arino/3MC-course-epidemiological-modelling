tree_locs_orig = cbind(elms_latlon$lon[indices_LT_kept$i],
                       elms_latlon$lat[indices_LT_kept$i])
tree_locs_dest = cbind(elms_latlon$lon[indices_LT_kept$j],
                       elms_latlon$lat[indices_LT_kept$j])
tree_pairs = do.call(
  sf::st_sfc,
  lapply(
    1:nrow(tree_locs_orig),
    function(i){
      sf::st_linestring(
        matrix(
          c(tree_locs_orig[i,],
            tree_locs_dest[i,]), 
          ncol=2,
          byrow=TRUE)
      )
    }
  )
)


library(deSolve)
rhs_logistic <- function(t, x, p) {
  with(as.list(x), {
    dN <- p$r * N *(1-N/p$K)
    return(list(dN))
  })
}
params = list(r = 0.1, K = 100)
IC = c(N = 50)
times = seq(0, 100, 1)
sol <- ode(IC, times, rhs_logistic, params)

rhs_logistic <- function(t, x, p) {
  with(as.list(c(x, p)), {
    dN <- r * N *(1-N/K)
    return(list(dN))
  })
}
params = list(r = 0.1, K = 100)
IC = c(N = 50)
times = seq(0, 100, 1)
sol <- ode(IC, times, rhs_logistic, params)
