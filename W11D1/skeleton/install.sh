npm init -y

npm install --save webpack webpack-cli \
react react-dom react-router-dom \
redux react-redux redux-logger \
@babel/core @babel/preset-env @babel/preset-react \
babel-loader

touch webpack.config.js

mkdir -p frontend/{actions,components,reducers,store,\
middleware,util}