
<template>
    <form class="form box" @submit.prevent="login">
        <h1 class="form__title">Se connecter</h1>
        <div class="form__group">
            <input type="text" class="form__control" v-model="form.email" placeholder="votre addresse e-mail">
            <small class="error__control" v-if="error.email">{{error.email[0]}}</small>
        </div>
        <div class="form__group">
            <input type="password" class="form__control" v-model="form.password" placeholder="votre mot de passe">
            <small class="error__control" v-if="error.password">{{error.password[0]}}</small>
        </div>
        <div class="form__group">
            <input type="submit" name="" value="Connecter">

        </div>
    </form>
    

</template>

        <script type="text/javascript" src="./auth.js" ></script>

