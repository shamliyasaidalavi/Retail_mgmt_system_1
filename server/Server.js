const express = require('express');
const mongoose = require("mongoose");
const registerRouter = require('./src/routes/registerRouter');

const productRouter = require('./src/routes/productrouter');
const cartRouter = require('./src/routes/cartRouter');
const counterRouter = require('./src/routes/counterRouter');
const godownRouter = require('./src/routes/godownRouter');
const deliveryboyRouter = require('./src/routes/deliveryboyRouter');
const offerRouter = require('./src/routes/offerRouter');
const orderRouter = require('./src/routes/orderRouter');

const userRouter = require('./src/routes/userRouter');
const loginRouter = require('./src/routes/login');
const paymentRouter = require('./src/routes/paymentRouter');
const categoryRouter = require('./src/routes/categoryRouter');
const salesRouter = require('./src/routes/salesRouter');


const app = express()

app.use(express.static('./public'));
app.use(express.urlencoded({ extended: true }));

app.get('/', function (req, res) {
  res.send('Hello, world!');
});

app.use('/register', registerRouter);
app.use('/product', productRouter);
app.use('/login', loginRouter);
app.use('/cart',cartRouter);
app.use('/counter',counterRouter);
app.use('/delivery',deliveryboyRouter)
app.use('/godown',godownRouter);
app.use('/offer',offerRouter);
app.use('/order',orderRouter);
app.use('/user',userRouter);
app.use('/payment',paymentRouter);
app.use('/category',categoryRouter);
app.use('/sales',salesRouter);


mongoose.connect('mongodb+srv://shamliya050:shamliya050@cluster0.e54v4o3.mongodb.net/Retail?retryWrites=true&w=majority').then(() => {
  app.listen(3000, function () {
    console.log("Server started at http://localhost:3000");
  });
}).catch((err) => {
  console.log(err);
});
