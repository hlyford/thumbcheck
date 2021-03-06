var gulp = require('gulp'),
    traceur = require('gulp-traceur'),
    babel = require('gulp-babel'),
    plumber = require('gulp-plumber'),
    es6Path = 'server/**/*.js',
    compilePath = 'compiled';

gulp.task('babel', function () {
    gulp.src([es6Path])
        .pipe(plumber())
        .pipe(babel())
        .pipe(gulp.dest(compilePath));
});

gulp.task('default', ['babel']);
