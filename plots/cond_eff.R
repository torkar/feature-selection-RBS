theme_set(theme_tufte())

p <- conditional_effects(M, effects = "prio_s", categorical = TRUE)
p_prio <- plot(p, plot = FALSE)[[1]] +
  scale_color_colorblind() +
  scale_fill_colorblind() +
  xlab("Priority") +
  theme(legend.position = "none")

p <- conditional_effects(M, effects = "crit", categorical = TRUE)
p_crit <- plot(p, plot = FALSE)[[1]] +
  scale_color_colorblind() +
  scale_fill_colorblind() +
  xlab("Criticality") +
  ylab("") +
  scale_x_continuous(breaks=seq(0,1))

p <- conditional_effects(M, effects = "sh_s", categorical = TRUE)
p_sh <- plot(p, plot = FALSE)[[1]] +
  scale_color_colorblind() +
  scale_fill_colorblind() +
  xlab("Num. stakeholders") +
  theme(legend.position = "none")

p <- conditional_effects(M, effects = "dep", categorical = TRUE)
p_dep <- plot(p, plot = FALSE)[[1]] +
  scale_color_colorblind() +
  scale_fill_colorblind() +
  xlab("Dependency") +
  ylab("") +
  theme(legend.position = "none") +
  scale_x_continuous(breaks=seq(0,1))

(p_prio | p_crit) / (p_sh | p_dep)

p <- conditional_effects(M, effects = "b_val", categorical = TRUE)
p_bval <- plot(p, plot = FALSE)[[1]] +
  scale_color_colorblind() +
  scale_fill_colorblind() +
  xlab("") +
  theme(axis.text.x = element_blank())

p <- conditional_effects(M, effects = "c_val", categorical = TRUE)
p_cval <- plot(p, plot = FALSE)[[1]] +
  scale_color_colorblind() +
  scale_fill_colorblind() +
  xlab("") +
  theme(legend.position = "none")

p_bval / p_cval
