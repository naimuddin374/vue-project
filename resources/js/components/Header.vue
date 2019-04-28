<template>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item active"><router-link to="/"><a class="nav-link" href="#">Home</a></router-link></li>
                        <li class="nav-item"><router-link to="/contact"><a class="nav-link" href="#">Contact us</a></router-link></li>
                        <li class="nav-item"><router-link to="/about"><a class="nav-link" href="#">About us</a></router-link></li>
                        <li class="nav-item"><router-link to="/users"><a class="nav-link" href="#">List of Users</a></router-link></li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</div>
</template>
<style>
ul>li{
    list-style: none;
    margin: 10px 20px 10px 0;
    font-size: 24px;
}
</style>