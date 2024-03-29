# Instructions for Reproducing Results

All running of `R` scripts must first set working directory to where the script locates.

1. Training samples are not used for performance evaluation. Generation of training samples is carried out through running [`0_Training/generate_train_dep.R`](0_Training/generate_train_dep.R) and [`0_Training/generate_train_indep.R`](0_Training/generate_train_indep.R). This step is optional for reproducing results.
2. The following 2 steps of sample generation may be skipped by downloading and extracting the file at [Dropbox link](https://www.dropbox.com/s/4ifz0vd58afl1pa/Reproducing.rar?dl=0}). 
3. Run [`1_Threshold/generate_threshold_indep.R`](1_Threshold/generate_threshold_indep.R) which generates the threshold sets. This set is used to estimate 95% quantiles for the trained models over a large set of independent samples.
4. To generate testing sets for performance evaluation:
  * Run [`2_Testing/generate_test_additional.R`](2_Testing/generate_test_additional.R);
  * Run [`2_Testing/generate_test_noise.R`](2_Testing/generate_test_noise.R);
  * Run [`2_Testing/scribble tests/generate_test_scribbles.R`](2_Testing/scribble tests/generate_test_scribbles.R);
  * Run [`2_Testing/image tests/generate_test_images.R`](2_Testing/image tests/generate_test_images.R);
  * Run all `R` scripts in [`2_Testing/dependent tests`](2_Testing/dependent tests) with [`Consolidation.R`](2_Testing/dependent tests/Consolidation.R) to be run at the end.
5. Run [`I_compute_thresholds.R`](I_compute_thresholds.R) to compute thresholds for the trained models.
6. Run [`II_compute_powers.R`](II_compute_powers.R) to compute powers for the trained models as well as other statistical tests.
7. Run [`III_plot_powers.R`](III_plot_powers.R) for power curves visualisation.
8. Run [`IV_print_powers.R`](IV_print_powers.R) to generate `LaTex` scripts for power tables.

