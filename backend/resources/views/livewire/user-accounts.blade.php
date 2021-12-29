<div>
    <button class="btn btn-primary float-right mb-3" data-toggle="modal" data-target="#new-account" type="button">
        <i class="fa fa-plus-circle"></i> new account
    </button>
    @if(count($accounts) !== 0)
        <table id="example2" class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>id</th>
                <th>Wallet Id</th>
                <th>Wallet Password</th>
            </tr>
            </thead>
            <tbody>
            @foreach($accounts as $account)
                <tr>
                    <td>{{ $account->id }}</td>
                    <td>{{ $account->wallet_id }}</td>
                    <td>{{ $account->wallet_password }}</td>
                </tr>
            @endforeach
            </tbody>
            <tfoot>
            <tr>
                <th>id</th>
                <th>Wallet Id</th>
                <th>Wallet Password</th>
            </tr>
            </tfoot>
        </table>
    @endif





    <!-- Modal -->
    <div class="modal fade" id="new-account" data-backdrop="static" data-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">New BlockChain Account</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="wallet-id">Wallet Id</label>
                                <input type="text" class="form-control" id="wallet-id" placeholder="Enter wallet id"
                                       wire:model.lazy="walletId">
                            </div>
                        </div>
                        <!-- /.card-body -->

                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary" wire:click.prevent="addAccount">Add</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <span class = "help-block">
                        Default password is <a href="">passcode@blockchain.default</a>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
